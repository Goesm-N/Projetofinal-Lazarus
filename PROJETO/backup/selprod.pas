unit selprod;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls, PesqProd, DB, DM;

type

  { TSelProdF }

  TSelProdF = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private

  public

  end;

var
  SelProdF: TSelProdF;

implementation
uses
  Orcamentos;

{$R *.lfm}

{ TSelProdF }

procedure TSelProdF.Button1Click(Sender: TObject);
begin
  PesqProdF:= TPesqProdF.Create(Self);
  PesqProdF.Show;
end;

procedure TSelProdF.Button2Click(Sender: TObject);
begin
    //  dataset is not in edit or insert mode
    DMF.qryOrcItem.Post;
    Close;
    //if DMF.qryOrcamentos.State in [dsInsert,dsEdit] then
    //begin
    //  OrcamentosF.dsCadModelo.DataSet.Post;
    //  OrcamentosF.dsCadModelo.DataSet.Insert;
    //
    //  DMF.qryOrcItem.Close;
    //  DMF.qryOrcItem.SQL.Clear;
    //  DMF.qryOrcItem.SQL.Add( 'SELECT *' +
    //                          ' FROM ORCAMENTO_ITEM ' +
    //                          ' WHERE ORCAMENTOID = ' + IntToStr(DMF.qryOrcamentosorcamentoid.AsInteger) +
    //                          ' ORDER BY ORCAMENTOID');
    //
    //   DMF.qryOrcItem.Open;
    //   end
    //else
    //begin
    //  OrcamentosF.dsCadModelo.DataSet.Insert;
    //  DMF.qryOrcItem.Close;
    //  DMF.qryOrcItem.SQL.Clear;
    //  DMF.qryOrcItem.SQL.Add( 'SELECT *'+
    //                          ' FROM ORCAMENTO_ITEM ' +
    //                          ' WHERE ORCAMENTOID = ' + IntToStr(DMF.qryOrcamentosorcamentoid.AsInteger) +
    //                          ' ORDER BY ORCAMENTOID');
    //  DMF.qryOrcItem.Open;
    //end;
end;

procedure TSelProdF.Button3Click(Sender: TObject);
begin
    DMF.qryOrcItem.Cancel;
   Close;
end;


procedure TSelProdF.DBEdit3Exit(Sender: TObject);
var
  quantidade,valor,total : Double ;
begin
   quantidade:= DMF.qryOrcItemqt_produto.AsFloat;
   valor:= DMF.qryOrcItemvl_unitario.AsFloat;
   if quantidade > 0 then
   begin
     total := quantidade * valor;
     DMF.qryOrcItemvl_total.AsString := FloatToStr(total);
   end;
end;


end.

