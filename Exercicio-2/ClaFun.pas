unit ClaFun;

interface

type

  TFunc = class
  private
    { private declarations }
    FNome: String;
    FCPF: String;
    FSalarioLiqui: Real;
    FSalarioBruto: Real;

  protected
    { protected declarations }
  public
    { public declarations }
    property Nome     :String read FNome write FNome;
    property CPF      :String read FCPF  write FCPF;
    property SalarioLiqui :Real  read FSalarioLiqui write FSalarioLiqui;
    property SalarioBruto :Real  read FSalarioBruto write FSalarioBruto;

  published
    { published declarations }


  end;

implementation

end.
