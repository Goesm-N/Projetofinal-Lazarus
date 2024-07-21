unit relprod;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, StdCtrls, ZDataset,
  LR_Class, LR_DBSet;

type

  { TRelProdF }

  TRelProdF = class(TForm)
    Button1: TButton;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    qryRelProd: TZQuery;
    qryRelProdcategoriaprodutoid: TLongintField;
    qryRelProdds_produto: TStringField;
    qryRelProddt_cadastro_produto: TDateTimeField;
    qryRelProdobs_produto: TStringField;
    qryRelProdprodutoid: TLongintField;
    qryRelProdstatus_produto: TStringField;
    qryRelProdvl_venda_produto: TFloatField;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  RelProdF: TRelProdF;

implementation

{$R *.lfm}

{ TRelProdF }

procedure TRelProdF.FormShow(Sender: TObject);
begin
  qryRelProd.Open;
  frReport1.LoadFromFile('RelProd.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

end.

