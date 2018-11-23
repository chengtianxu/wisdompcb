unit qk20003Edit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseGridFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls, RzEdit, RzButton,
  FireDAC.Comp.Client,FireDAC.Stan.Param,qkSvrIntf.ClientIntf,qkFunc.Commfunc,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet;

type
  Tfrmqk20003Edit2 = class(TfrmqkbaseGrid)
    pnl1: TPanel;
    btnSqlTxt: TRzBitBtn;
    pnl2: TPanel;
    btn1: TRzButton;
    mmo1: TRzMemo;
    procedure btnSqlTxtClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GeneratDetail(ADs: TFDMemTable);
  end;


implementation

{$R *.dfm}

procedure Tfrmqk20003Edit2.btn1Click(Sender: TObject);
begin
  qkTmp.mtfree;
  try
    if qkDataIntf.DirectSqlOpen(qkTmp.mt,mmo1.Text) then
    begin
      GeneratDetail(qkTmp.mt);
    end;
  finally
    qkTmp.mtfree;
  end;
end;

procedure Tfrmqk20003Edit2.btnSqlTxtClick(Sender: TObject);
begin
  inherited;
  pnl2.Visible := not pnl2.Visible;
end;

procedure Tfrmqk20003Edit2.GeneratDetail(ADs: TFDMemTable);
var
  I: Integer;
begin
  if DataSet <> nil then
  begin
    DataSet.First;
    while not DataSet.IsEmpty do
    begin
      DataSet.Delete;
    end;

    for I := 0 to ADs.Fields.Count -1 do
    begin
      DataSet.Append;
      DataSet.FieldByName('Seqno').AsInteger := I;
      DataSet.FieldByName('Title').AsString := ADs.Fields[I].FieldName;
      DataSet.FieldByName('FieldName').AsString := ADs.Fields[I].FieldName;
      DataSet.FieldByName('ReadOnly').AsBoolean := False;
      DataSet.Post;
    end;
  end;

end;

end.
