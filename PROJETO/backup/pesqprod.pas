unit PesqProd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, PesqMod, DB, DM, DBCtrls;

type

  { TPesqProdF }

  TPesqProdF = class(TPesqModF)
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
  private

  public

  end;

var
  PesqProdF: TPesqProdF;

implementation
uses
  selprod,Orcamentos;

{$R *.lfm}

{ TPesqProdF }

procedure TPesqProdF.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
     ShowMessage('Insira um valor');
     DMF.qryProdutos.Close;
     DMF.qryProdutos.Open;
    end
  else
  DMF.qryProdutos.Close;
  DMF.qryProdutos.SQL.Clear;
  DMF.qryProdutos.SQL.Text:=
  'SELECT *'+
  ' FROM PRODUTO'+
  ' WHERE PRODUTOID = ' +QuotedStr(Edit1.Text);
  DMF.qryCategoria.Open;
end;

procedure TPesqProdF.DBGrid1DblClick(Sender: TObject);
begin
  DMF.qryOrcItemprodutoid.AsInteger   := DMF.qryProdutosprodutoid.AsInteger;
  DMF.qryOrcItemvl_unitario.AsFloat   := DMF.qryProdutosvl_venda_produto.AsFloat;
  DMF.qryOrcItemprodutodesc.AsString      := DMF.qryProdutosds_produto.AsString;
  DMF.qryOrcItemprodutodesc.AsString  := DMF.qryProdutosds_produto.AsString;
  Close;
end;

procedure TPesqProdF.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType
  );
begin
  DMF.qryProdutos.Close;
  DMF.qryProdutos.SQL.Clear;
  DMF.qryProdutos.SQL.Text:= 'select * from produto';
  DMF.qryProdutos.Open;
  Edit1.Text:= '';
end;

end.

