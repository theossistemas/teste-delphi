unit unDmGeral;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

type
  TdmGeral = class(TDataModule)
    imgFolders: TImageList;
    ImageList: TImageList;
    imgMenus24: TImageList;
    imgBarraCon: TImageList;
    imgBar16: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmGeral: TdmGeral;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
