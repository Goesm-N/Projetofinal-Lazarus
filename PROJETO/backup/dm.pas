unit DM;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset, DB;

type

  { TDMF }

  TDMF = class(TDataModule)
    qryCategoriacategoriaprodutoid: TLongintField;
    qryCategoriads_categoria_produto: TStringField;
    qryClientesclienteid: TLongintField;
    qryClientescpf_cnpj_cliente: TStringField;
    qryClientesnome_cliente: TStringField;
    qryClientestipo_cliente: TStringField;
    qryOrcamentosclienteid: TLongintField;
    qryOrcamentosdt_orcamento: TDateTimeField;
    qryOrcamentosdt_validade_orcamento: TDateTimeField;
    qryOrcamentosorcamentoid: TLongintField;
    qryOrcamentosvl_total_orcamento: TFloatField;
    qryOrcItemorcamentoid: TLongintField;
    qryOrcItemorcamentoitemid: TLongintField;
    qryOrcItemprodutodesc: TStringField;
    qryOrcItemprodutoid: TLongintField;
    qryOrcItemqt_produto: TFloatField;
    qryOrcItemvl_total: TFloatField;
    qryOrcItemvl_unitario: TFloatField;
    qryProdutoscategoriaprodutoid: TLongintField;
    qryProdutosds_produto: TStringField;
    qryProdutosdt_cadastro_produto: TDateTimeField;
    qryProdutosobs_produto: TStringField;
    qryProdutosprodutoid: TLongintField;
    qryProdutosstatus_produto: TStringField;
    qryProdutosvl_venda_produto: TFloatField;
    qryUsuariosid: TLongintField;
    qryUsuariosnome_completo: TStringField;
    qryUsuariossenha: TStringField;
    qryUsuariosusuario: TStringField;
    ZConnection1: TZConnection;
    qryCategoria: TZQuery;
    qryClientes: TZQuery;
    qryProdutos: TZQuery;
    qryUsuarios: TZQuery;
    qryOrcamentos: TZQuery;
    qryOrcItem: TZQuery;
    qryGenerica: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryCategoriaNewRecord(DataSet: TDataSet);
    procedure qryClientesNewRecord(DataSet: TDataSet);
    procedure qryOrcamentosAfterInsert(DataSet: TDataSet);
    procedure qryOrcamentosNewRecord(DataSet: TDataSet);
    procedure qryOrcItemNewRecord(DataSet: TDataSet);
    procedure qryProdutosNewRecord(DataSet: TDataSet);
    procedure qryUsuariosNewRecord(DataSet: TDataSet);
  private

  public
     function getSequence(const pNomeSequence: String) : String;
     procedure SomaItens;
  end;

var
  DMF: TDMF;

implementation
uses
  Orcamentos;

{$R *.lfm}

{ TDMF }


function TDMF.getSequence(const pNomeSequence: String): String;
begin
     Result := '';
 try
     qryGenerica.close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('SELECT NEXTVAL(' + QuotedStr(pNomeSequence) + ') AS CODIGO');
     qryGenerica.Open;
     Result := qryGenerica.FieldByName('CODIGO').AsString;
 finally
   qryGenerica.Close;
 end;
end;


procedure TDMF.DataModuleCreate(Sender: TObject);
begin
  ZConnection1.HostName := 'localhost';
  ZConnection1.DataBase := 'postgres';
  ZConnection1.User     := 'postgres';
  ZConnection1.Password := '1234';
  ZConnection1.Port     := 5432;
  ZConnection1.Protocol := 'postgresql';
  ZConnection1.Connected:= True;
end;

procedure TDMF.qryCategoriaNewRecord(DataSet: TDataSet);
begin
  //DMF.qryGenericaCat.Close;
  //DMF.qryGenericaCat.SQL.Clear;
  //DMF.qryGenericaCat.SQL.Add('select nextval('+ QuotedStr('categoria_produto_categoriaprodutoid_seq')+') AS CODIGO');
  //DMF.qryGenericaCat.Open;

  qryCategoriacategoriaprodutoid.AsInteger:= StrToInt(getSequence('categoria_produto_categoriaprodutoid_seq'));
end;

procedure TDMF.qryClientesNewRecord(DataSet: TDataSet);
begin
  //DMF.qryGenericaClientes.Close;
  //DMF.qryGenericaClientes.SQL.Clear;
  //DMF.qryGenericaClientes.SQL.Add('select nextval('+ QuotedStr('cliente_clienteiGO');   d')+') AS CODI
  //DMF.qryGenericaClientes.Open;
  //
  qryClientesclienteid.AsInteger:= StrToInt(getSequence('cliente_clienteid'));
end;

procedure TDMF.qryOrcamentosAfterInsert(DataSet: TDataSet);
begin
   //CREATE SEQUENCE orcamento_orcamentoid_seq          ///????????????
  //qryOrcamentoorcamentoid.AsInteger            := StrToInt(getSequence('orcamento_orcamentoid_seq'));
  //qryOrcamentodt_orcamento.AsDateTime          := StrToDate(formatdatetime('dd/mm/yyyy', now));
  //qryOrcamentodt_validade_orcamento.AsDateTime := StrToDate(formatdatetime('dd/mm/yyyy', now + 15));
end;

procedure TDMF.qryOrcamentosNewRecord(DataSet: TDataSet);
begin
  //DMF.qryGenericaOrc.Close;
  //DMF.qryGenericaOrc.SQL.Clear;
  //DMF.qryGenericaOrc.SQL.add('select nextval('+ QuotedStr('orcamento_orcamentoid_seq')+') AS CODIGO');
  //DMF.qryGenericaOrc.Open;

  qryOrcamentosorcamentoid.AsInteger:= StrToInt(getSequence('orcamento_orcamentoid_seq'));
end;

procedure TDMF.qryOrcItemNewRecord(DataSet: TDataSet);
begin
 // GenericaOrcITEM add proximo ID de produto (orcamentoitemid)
 //DMF.qryGenericaOrcItem.Close;
 //DMF.qryGenericaOrcItem.SQL.Clear;
 //DMF.qryGenericaOrcItem.SQL.Add('select nextval('+ QuotedStr('orcamento_orcamentoid_seq ')+') AS CODIGO');
 //
 //qryOrcItemorcamentoitemid.AsInteger:= DMF.qryGenericaOrcItem.FieldByName('CODIGO').AsInteger;
end;

procedure TDMF.qryProdutosNewRecord(DataSet: TDataSet);
begin
  //DMF.qryGenericaProd.Close;
  //DMF.qryGenericaProd.SQL.Clear;
  //DMF.qryGenericaProd.SQL.Add('select nextval('+ QuotedStr('produto_produtoid')+') AS CODIGO');
  //DMF.qryGenericaProd.Open;

  qryProdutosprodutoid.AsInteger:= StrToInt(getSequence('produto_produtoid'));
end;

procedure TDMF.qryUsuariosNewRecord(DataSet: TDataSet);
begin
  //DMF.qryGenericaUsuarios.Close;
  //DMF.qryGenericaUsuarios.SQL.Clear;
  //DMF.qryGenericaUsuarios.SQL.Add('select nextval('+ QuotedStr('usuario_id')+') AS CODIGO');
  //DMF.qryGenericaUsuarios.Open;

  qryUsuariosid.AsInteger:= StrToInt(getSequence('usuario_id'));;
end;

procedure TDMF.SomaItens;
Begin
  if not (DMF.qryOrcamentos.State in [dsEdit, dsInsert]) then
     DMF.qryOrcamentos.Edit;

  if not (DMF.qryOrcItem.State in [dsEdit, dsInsert]) then
     DMF.qryOrcItem.Edit;

  //Vai pro Primeiro
  DMF.qryOrcItem.First;
  DMF.qryOrcamentosvl_total_orcamento.AsFloat := 0;
  while not DMF.qryOrcItem.Eof do
  begin
    DMF.qryOrcamentosvl_total_orcamento.AsFloat := DMF.qryOrcamentosvl_total_orcamento.AsFloat + DMF.qryOrcItemvl_total.AsFloat;
    DMF.qryOrcItem.next;
  end;
end;

end.

