unit Theos.Controller.Principal;

interface

uses
  Vcl.Forms, System.SysUtils,

  Theos.Lib.Resource,
  View.Principal,

  Theos.Controller.Calculadora,

  Theos.Controller.Funcionario.Base;

type
  TControllerPrincipal = class sealed
  private
    class var
      FInstance: TControllerPrincipal;
  strict private
    type
      ECreateSingletonTControllerPrincipal = class(Exception);

    var
      FView: TViewPrincipal;

    constructor CreatePrivate;
    class function GetInstance: TControllerPrincipal; static;
    procedure Init;
    procedure BindEvents;

    procedure BtnCalculadoraClick(Sender: TObject);
    procedure BtnFuncionarioClick(Sender: TObject);
  public
    class property Instance: TControllerPrincipal read GetInstance;

    constructor Create; reintroduce;
    destructor Destroy; override;

  end;

implementation

procedure TControllerPrincipal.BtnCalculadoraClick(Sender: TObject);
begin
  var objControllerCalculadora := TControllerCalculadora.Create;
  try
    objControllerCalculadora.ShowModal;
  finally
    objControllerCalculadora.Free;
  end;
end;

constructor TControllerPrincipal.Create;
begin
  raise ECreateSingletonTControllerPrincipal.CreateFmt(MENSAGEM_ERRO_CREATE_SINGLETON, [Self.ClassName]);
end;

constructor TControllerPrincipal.CreatePrivate;
begin
  inherited Create;
  Init;
end;

destructor TControllerPrincipal.Destroy;
begin
  FView := nil;
  inherited Destroy;
end;

class function TControllerPrincipal.GetInstance: TControllerPrincipal;
begin
  if not Assigned(FInstance) then
    FInstance := TControllerPrincipal.CreatePrivate;
  Result := FInstance;
end;

procedure TControllerPrincipal.Init;
begin
  Application.CreateForm(TViewPrincipal, FView);
  BindEvents;
end;

procedure TControllerPrincipal.BindEvents;
begin
  FView.BtnCalculadora.OnClick := BtnCalculadoraClick;
  FView.BtnFuncionario.OnClick := BtnFuncionarioClick;
end;

procedure TControllerPrincipal.BtnFuncionarioClick(Sender: TObject);
begin
  var ControllerFuncionarioBase := TControllerFuncionarioBase.Create;
  try
    ControllerFuncionarioBase.ShowModal;
  finally
    ControllerFuncionarioBase.Free;
  end;
end;

initialization

finalization
  if Assigned(TControllerPrincipal.FInstance) then
    FreeAndNil(TControllerPrincipal.FInstance);
end.
