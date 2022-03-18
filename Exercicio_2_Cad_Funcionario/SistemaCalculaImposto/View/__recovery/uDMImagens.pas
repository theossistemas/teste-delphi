unit uDMImagens;

interface

uses
  System.SysUtils, System.Classes;

type
  TDataModule1 = class(TDataModule)
    ImageList1: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
