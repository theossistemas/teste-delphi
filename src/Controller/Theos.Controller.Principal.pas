unit Theos.Controller.Principal;

interface

uses
  Vcl.Forms, System.SysUtils,
  Theos.Controller.Calculadora,
  View.Principal;

resourcestring
  MENSAGEM_ERRO_CREATE_SINGLETON = 'Apenas uma instância da classe %s permitida no Padrão Singleton';

type
  TControllerPrincipal = class sealed
  strict private
    type
      ECreateSingleton = class(Exception);

    var
      FView: TViewPrincipal;

    class var
      FInstance: TControllerPrincipal;

    constructor CreatePrivate;
    class function GetInstance: TControllerPrincipal; static;
    procedure Init;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCalculadoraClick(Sender: TObject);
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
  raise ECreateSingleton.CreateFmt(MENSAGEM_ERRO_CREATE_SINGLETON, [Self.ClassName]);
end;

constructor TControllerPrincipal.CreatePrivate;
begin
  inherited Create;
  Init;
end;

destructor TControllerPrincipal.Destroy;
begin
  FView.Release;
  FView := nil;
  inherited Destroy;
end;

procedure TControllerPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FInstance) then
    FreeAndNil(FInstance);
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
  FView.OnClose := Self.FormClose;
  FView.BtnCalculadora.OnClick := BtnCalculadoraClick;
end;

end.
