unit Controller.Calculator.Intf;

interface

uses
  Model.Calculator.Intf;

type
  IControllerCalculator = interface
    ['{BE52FA3E-6BF4-4895-B9D4-D40FB104C2F1}']
    function Services: IModelCalculator;
  end;

implementation

end.
