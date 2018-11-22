unit UTogather;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGridEh, DB,
  ADODB;

type
  TfrmTotather = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    BitBtn1: TBitBtn;
    btn1: TSpeedButton;
    Label4: TLabel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    qry_detail: TADOQuery;
    ds_Detail: TDataSource;
    dsV: TDataSource;
    qryV: TADOQuery;
    dsH: TDataSource;
    qryH: TADOQuery;
    eh1: TDBGridEh;
    sg1: TStringGrid;
    cbb1: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   function return_row(AField:Variant;AValue:Variant):integer;
   function return_col(AField:Variant;AValue:Variant):integer;
  public
    { Public declarations }
   // Fname1,Fname2:string;
  end;

var
  frmTotather: TfrmTotather;

implementation
  uses common,damo;
{$R *.dfm}

procedure TfrmTotather.FormActivate(Sender: TObject);
var
 i,m,n:integer;
begin
  cbb1.ItemIndex:=0;
  pgc1.ActivePageIndex:=0;

sg1.RowCount:=qryV.RecordCount+2;
sg1.ColCount:=qryH.RecordCount+2;

for i:=0 to eh1.Columns.Count-1 do
  eh1.Columns[i].Width:=100;

 qryV.First;  //1.列
 for i:=1 to qryV.RecordCount do
 begin
  sg1.Cells[0,i]:=qryV.Fields[0].asstring;//第一列名称
        //最后一列的汇总
  if cbb1.ItemIndex=0 then   //  数量
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('投产PCS数').AsString
  else if cbb1.ItemIndex=1 then   //  面积
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('不含板边投产面积').AsString
  else if cbb1.ItemIndex=2 then   //  不含税金额
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('订单pcs数').AsString
  else if cbb1.ItemIndex=3 then   //  含税金额
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('订单面积').AsString;
  qryV.Next;
 end;
  ///////////////////////////////////
 qryH.First;     //行
for i:=1 to qryH.RecordCount do
 begin
    sg1.Cells[i,0]:=qryH.Fields[0].asstring;     //第一行值
        //最后一行的汇总
    if cbb1.ItemIndex=0 then   //  数量
     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('投产PCS数').AsString
    else if cbb1.ItemIndex=1 then   //  面积
     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('不含板边投产面积').AsString
    else if cbb1.ItemIndex=2 then   //  不含税金额
     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('订单pcs数').AsString
    else if cbb1.ItemIndex=3 then   //  含税金额
   sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('订单面积').AsString;

  qryH.Next;
 end;

 ///////////////////////////////////////////////填中间的值
qry_detail.DisableControls;
qry_detail.First;
 while not qry_detail.Eof do
 begin
    if cbb1.ItemIndex=0 then   //  数量
    begin
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('投产PCS数').asstring
    end             
    else  if cbb1.ItemIndex=1 then  // 面积
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('不含板边投产面积').asstring
    else  if cbb1.ItemIndex=2 then  // 不含税金额
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('订单pcs数').asstring
      else  if cbb1.ItemIndex=3 then  //   含税金额
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('订单面积').asstring;

  qry_detail.Next;
 end;
  qry_detail.First;
  qry_detail.EnableControls;

    //汇总字样：
  sg1.Cells[0,0]:=qryV.Fields[0].FieldName;
  sg1.Cells[sg1.ColCount-1,0]:='汇总';
  sg1.Cells[0,sg1.RowCount-1]:='汇总';

end;

procedure TfrmTotather.cbb1Change(Sender: TObject);
var i:integer;
begin
 qryV.First;  //1.列
 for i:=1 to qryV.RecordCount do
 begin
  //sg1.Cells[0,i]:=qryV.Fields[0].asstring;//第一列名称
        //最后一列的汇总
  if cbb1.ItemIndex=0 then   //  数量
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('投产PCS数').AsString
  else if cbb1.ItemIndex=1 then   //  面积
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('不含板边投产面积').AsString
  else if cbb1.ItemIndex=2 then   //  不含税金额
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('订单pcs数').AsString
  else if cbb1.ItemIndex=3 then   //  含税金额
   sg1.Cells[sg1.ColCount-1,i]:=qryV.fieldbyname('订单面积').AsString;
  qryV.Next;
 end;
  ///////////////////////////////////
 qryH.First;     //行
for i:=1 to qryH.RecordCount do
 begin
   // sg1.Cells[i,0]:=qryH.Fields[0].asstring;     //第一行值
        //最后一行的汇总
    if cbb1.ItemIndex=0 then   //  数量
     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('投产PCS数').AsString
    else if cbb1.ItemIndex=1 then   //  面积
     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('不含板边投产面积').AsString
    else if cbb1.ItemIndex=2 then   //  不含税金额
     sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('订单pcs数').AsString
    else if cbb1.ItemIndex=3 then   //  含税金额
   sg1.Cells[i,sg1.RowCount-1]:=qryH.fieldbyname('订单面积').AsString;

  qryH.Next;
 end;
///////////////////////////////////////////////填中间的值
qry_detail.DisableControls;
qry_detail.First;
 while not qry_detail.Eof do
 begin
    if cbb1.ItemIndex=0 then   //  数量
    begin
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('投产PCS数').asstring
    end             
    else  if cbb1.ItemIndex=1 then  // 面积
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('不含板边投产面积').asstring
    else  if cbb1.ItemIndex=2 then  // 不含税金额
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('订单pcs数').asstring
      else  if cbb1.ItemIndex=3 then  //   含税金额
     sg1.Cells[return_col(qry_detail.fields[1].FieldName,qry_detail.fields[1].value),
                  return_row(qry_detail.fields[0].FieldName,qry_detail.fields[0].value)]:=
                  qry_detail.fieldbyname('订单面积').asstring;

  qry_detail.Next;
 end;
  qry_detail.First;
  qry_detail.EnableControls;

end;

function TfrmTotather.return_col(AField, AValue: Variant): integer;
begin
 if qryH.Locate(afield,AValue,[]) then
 result:=qryH.RecNo
else
 result:=0;
end;

function TfrmTotather.return_row(AField, AValue: Variant): integer;
//var
// s:string;
begin
  //s:=  afield;
  if qryV.Locate(afield,AValue,[]) then
 result:=qryV.RecNo
else
 result:=0;
end;

procedure TfrmTotather.btn1Click(Sender: TObject);
begin
  if  pgc1.ActivePageIndex=0 then
  begin
    if (not qry_detail.IsEmpty) then Export_dbGridEH_to_Excel(eh1,ts1.Caption);
  end
  else
  begin
    if  sg1.RowCount>2 then
    common.Export_Grid_to_Excel(sg1,ts2.Caption);
  end;
end;

procedure TfrmTotather.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TfrmTotather.pgc1Change(Sender: TObject);
begin
  if pgc1.activepageindex=1 then
  begin
  cbb1.Enabled:=True;
  //btn1.Enabled:=false;
  end
  else
  begin
  cbb1.Enabled:=false;
  //btn1.Enabled:=true;
  end
end;

procedure TfrmTotather.eh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then showmessage(qry_detail.SQL.Text);
end;

procedure TfrmTotather.FormShow(Sender: TObject);
begin
  eh1.Columns[0].Field:=qry_detail.Fields[0];
  eh1.Columns[1].Field:=qry_detail.Fields[1];
  eh1.Columns[0].Footer.FieldName:=qry_detail.Fields[0].FieldName;
  eh1.Columns[1].Footer.FieldName:=qry_detail.Fields[1].FieldName;
  eh1.Columns[0].Title.caption:= qry_detail.Fields[0].FieldName;
  eh1.Columns[1].Title.caption:=qry_detail.Fields[1].FieldName;
   
end;

end.
