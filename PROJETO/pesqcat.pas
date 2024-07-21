unit PesqCat;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, ExtCtrls,
  StdCtrls, DM;

type

  { TPesqCatF }

  TPesqCatF = class(TForm)
    BtnPesquisa: TButton;
    dsPesqCat: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    procedure BtnPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

var
  PesqCatF: TPesqCatF;

implementation
uses
  CadProdutos;

{$R *.lfm}

{ TPesqCatF }

procedure TPesqCatF.DBGrid1DblClick(Sender: TObject);
begin
  CadProdutosF.DBEdtIDCat.Text:= DMF.qryCategoriacategoriaprodutoid.AsString;
  Close;
end;

procedure TPesqCatF.BtnPesquisaClick(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
     ShowMessage('Insira um valor');
     DMF.qryCategoria.Close;
     DMF.qryCategoria.Open;
    end
  else
  DMF.qryCategoria.Close;
  DMF.qryCategoria.SQL.Clear;
  DMF.qryCategoria.SQL.Text:=
  'SELECT *'+
  ' FROM CATEGORIA_PRODUTO'+
  ' WHERE DS_CATEGORIA_PRODUTO = '+ QuotedStr(UpperCase('%' + Edit1.Text + '%'))  +
  ' ORDER BY DS_CATEGORIA_PRODUTO';
  DMF.qryCategoria.Open;
end;

procedure TPesqCatF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  CloseAction:= caFree;
end;

end.

