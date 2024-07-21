unit RelCliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, LR_Class, RelMod;

type

  { TRelClienteF }

  TRelClienteF = class(TRelModF)
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  RelClienteF: TRelClienteF;

implementation

{$R *.lfm}

{ TRelClienteF }

procedure TRelClienteF.Button1Click(Sender: TObject);
begin
   frReport1.LoadFromFile('RelMod.lrf');
   frReport1.PrepareReport;
   frReport1.ShowReport;
end;

procedure TRelClienteF.FormShow(Sender: TObject);
begin
  RelModF.qryRelMod.Open;
end;

end.

