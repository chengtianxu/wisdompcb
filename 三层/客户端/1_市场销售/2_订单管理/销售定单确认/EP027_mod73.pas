unit EP027_mod73;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms,uBaseMainFrm, Vcl.Dialogs, Vcl.ImgList, Vcl.ComCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Vcl.XPMan, Vcl.Menus, Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB;

type
  TForm_mod73 = class(TfrmBaseMain)
  Panel1: TPanel;
  bit: TBitBtn;
  DBGridEh1: TDBGridEh;
  N1: TMenuItem;
  N2: TMenuItem;
  N4: TMenuItem;
  N5: TMenuItem;
  N6: TMenuItem;
  N8: TMenuItem;
  StringGrid1: TStringGrid;
  StringGrid2: TStringGrid;
  ClientDataSet1: TClientDataSet;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure N1Click(Sender: TObject);
  procedure pmMainPopup(Sender: TObject);
  procedure bitClick(Sender: TObject);
  procedure N5Click(Sender: TObject);
  procedure pmZDPopup(Sender: TObject);
  procedure StringGrid1DblClick(Sender: TObject);
  procedure StringGrid2DblClick(Sender: TObject);
  procedure N2Click(Sender: TObject);
  procedure N6Click(Sender: TObject);
  procedure N4Click(Sender: TObject);
  procedure edit_note1060(so,rkey10:string);
  procedure StringGrid1Click(Sender: TObject);
  procedure StringGrid2Click(Sender: TObject);
  procedure N8Click(Sender: TObject);
  procedure btnExportToExcelClick(Sender: TObject);
    procedure btnZDClick(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  po_note:tstringlist; //评审记事本
  LEDate:TDateTime;
  { Private declarations }
 public
 procedure GetData;override;
 procedure getdataedit(rkey:string);
 procedure getdataremark(so:string);

  { Public declarations }
end;

var
  Form_mod73: TForm_mod73;

implementation

{$R *.dfm}

uses details_mod73,URemark_mod73, uCommFunc, Umost, Uso_mod73,
  UeditRemark_mod73;

procedure TForm_mod73.btnExportToExcelClick(Sender: TObject);
begin
 if not gFunc.CheckUserAuth(3,73) then  Exit;
  try
  Form2:=TForm2.Create(Application);
  Form2.InitWithPickID(73,12);
  if Form2.cdsPick.IsEmpty then
  begin
   ShowMessage('没有应期退回的销售定单!');
   Exit;
  end;
  Form2.ShowModal;
 finally
  Form2.Free;
 end;
end;

procedure TForm_mod73.btnRefreshClick(Sender: TObject);
begin
 if not gFunc.CheckUserAuth(2,73) then  Exit;
 try
  Form1:=TForm1.Create(Application);
  Form1.InitWithPickID(73,11);
  Form1.ShowModal;
 finally
  Form1.Free;
 end;

end;

procedure TForm_mod73.btnZDClick(Sender: TObject);
begin
// ShowMessage('权限1:只读 权限2:确认及反确认 权限3:应期退回 权限4:最高权限');

end;

procedure TForm_mod73.edit_note1060(so, rkey10: string);
var
 i:integer;
begin
 try
  Remark_mod73:=TRemark_mod73.Create(application);
  Remark_mod73.Caption:='确认记事本:'+so;
  Remark_mod73.Memo1.Lines.Assign(po_note);
  if Remark_mod73.ShowModal=mrok then
  begin
   if trim(Remark_mod73.Memo1.Text)<>'' then
   begin
    po_note.Text:=trim(Remark_mod73.Memo1.Text);
   end;
  end;
 finally
  cost_mod73.free;
 end;
end;

procedure TForm_mod73.FormCreate(Sender: TObject);
   var
 i:integer;
begin
  stringgrid1.Cells[0,0] := '销售订单';
  stringgrid1.Cells[1,0] := '下单日期';
  stringgrid1.Cells[2,0] := '计划交期';
  stringgrid1.Cells[3,0] := '回复交期';
  stringgrid1.Cells[4,0] := '数量Pcs';
  stringgrid1.Cells[5,0] := '客户代码';
  stringgrid1.Cells[6,0] := '客户简称';
  stringgrid1.Cells[7,0] := '客户订单号';
  stringgrid1.Cells[8,0] := '本厂编号';
  stringgrid1.Cells[9,0] := '客户型号';
  StringGrid1.Cells[12,0]:= '客户交期';
  StringGrid1.Cells[13,0]:= '原始客户交期';
  StringGrid1.Cells[14,0]:= '关联原客户';
  StringGrid1.Cells[15,0]:= '工厂简称';
  StringGrid1.Cells[16,0]:= '加工形式';
  stringgrid1.ColWidths[10]:=-1;
  stringgrid1.ColWidths[11]:=-1;


  stringgrid2.Cells[0,0] := '销售订单';
  stringgrid2.Cells[1,0] := '下单日期';
  stringgrid2.Cells[2,0] := '计划交期';
  stringgrid2.Cells[3,0] := '回复交期';
  stringgrid2.Cells[4,0] := '数量Pcs';
  stringgrid2.Cells[5,0] := '客户代码';
  stringgrid2.Cells[6,0] := '客户简称';
  stringgrid2.Cells[7,0] := '客户订单号';
  stringgrid2.Cells[8,0] := '本厂编号';
  stringgrid2.Cells[9,0] := '客户型号';
  StringGrid2.Cells[12,0]:= '客户交期';
  StringGrid2.Cells[13,0]:= '原始客户交期';
  StringGrid2.Cells[14,0]:= '关联原客户';
  StringGrid2.Cells[15,0]:= '工厂简称';
  StringGrid2.Cells[16,0]:= '加工形式';
  stringgrid2.ColWidths[10]:=-1;
  stringgrid2.ColWidths[11]:=-1;
 stringgrid1.RowCount := cdsMain.RecordCount+2;

 for i:= 1 to cdsMain.RecordCount do
  begin
   stringgrid1.Cells[0,i] := cdsMain.fieldbyname('sales_order').AsString;
   stringgrid1.Cells[1,i] := cdsMain.fieldbyname('ent_date').AsString;
   stringgrid1.Cells[2,i] := cdsMain.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString;
   stringgrid1.Cells[3,i] := cdsMain.fieldbyname('sch_date').AsString;
   stringgrid1.Cells[4,i] := cdsMain.fieldbyname('PARTS_ORDERED').AsString;
   stringgrid1.Cells[5,i] := cdsMain.fieldbyname('cust_code1').AsString;
   stringgrid1.Cells[6,i] := cdsMain.fieldbyname('cust_code').AsString;
   stringgrid1.Cells[7,i] := cdsMain.fieldbyname('po_number').AsString;
   stringgrid1.Cells[8,i] := cdsMain.fieldbyname('manu_part_number').AsString;
   stringgrid1.Cells[9,i] := cdsMain.fieldbyname('manu_part_desc').AsString;
   stringgrid1.Cells[12,i] := cdsMain.fieldbyname('ORIG_REQUEST_DATE').AsString;
   stringgrid1.Cells[13,i] := cdsMain.fieldbyname('DUE_DATE').AsString;
   stringgrid1.Cells[14,i] := cdsMain.fieldbyname('ORIG_CUSTOMER').AsString;
   stringgrid1.Cells[15,i] := cdsMain.fieldbyname('ABBR_NAME').AsString;
   stringgrid1.Cells[16,i] := cdsMain.fieldbyname('sotp').AsString;
   stringgrid1.Cells[10,i] := inttostr(i);
   stringgrid1.Cells[11,i] := cdsMain.fieldbyname('rkey').AsString;

   cdsMain.Next;
  end;
//  self.WindowState:=wsMaximized;
  po_note:=tstringlist.Create;


end;

procedure TForm_mod73.GetData;
begin
 FMainFrmSql:=cdsMain.CommandText;
 inherited;
end;

procedure TForm_mod73.getdataedit(rkey: string);
var sql:string;
begin
 sql:=ClientDataSet1.CommandText+' WHERE RKEY IN ( '+rkey+' )';
 gSvrIntf.IntfGetDataBySql(sql,ClientDataSet1);
end;

procedure TForm_mod73.getdataremark(so: string);
var cds60:TClientDataSet;
    sql60:string;
begin
 sql60:='select RemarkAudit from data0060 where Rkey='+quotedstr(so);
 cds60:=TClientDataSet.Create(Self);
 gSvrIntf.IntfGetDataBySql(sql60,cds60);
 with cds60 do
 begin
  if not isempty then
  begin
   po_note.Clear;
   po_note.Text := fieldvalues['RemarkAudit'];
  end;
 end;
end;

procedure TForm_mod73.N1Click(Sender: TObject);
var
 i:integer;
begin

 stringgrid2.Rows[stringgrid2.RowCount-1].Text:=stringgrid1.Rows[stringgrid1.row].Text;
 stringgrid2.RowCount:= stringgrid2.RowCount+1;
 for i:= stringgrid1.row to stringgrid1.RowCount-2 do
 stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
end;

procedure TForm_mod73.N2Click(Sender: TObject);
begin
 try
  form_details:= tform_details.Create(application);
  Form_details.GetData(strtoint(stringgrid1.Cells[11,stringgrid1.row]));
  Form_details.ShowModal;
 finally
  Form_details.Free;
 end;

end;

procedure TForm_mod73.N4Click(Sender: TObject);
begin

 Remark_mod73:=TRemark_mod73.Create(Application);
 self.edit_note1060(stringgrid1.Cells[0,stringgrid1.row],Stringgrid1.Cells[11,stringgrid1.row]);
 //Remark_mod73.ShowModal;



end;

procedure TForm_mod73.N5Click(Sender: TObject);
var
 i,j:integer;
begin
if stringgrid1.RowCount=2 then
  stringgrid1.Rows[1].Text := stringgrid2.Rows[stringgrid2.row].Text;
for i:=1 to stringgrid1.RowCount-2 do
 if strtoint(stringgrid1.Cells[10,i])>strtoint(stringgrid2.Cells[10,stringgrid2.row]) then
  begin
    for j:=stringgrid1.RowCount-1 downto i do
     if j<>i then
      stringgrid1.Rows[j].Text := stringgrid1.Rows[j-1].Text
     else
      stringgrid1.Rows[j].Text := stringgrid2.Rows[stringgrid2.row].Text;
    break;
  end
 else
  if i=stringgrid1.RowCount-2 then
   stringgrid1.Rows[i+1].Text := stringgrid2.Rows[stringgrid2.row].Text;
 stringgrid1.RowCount := stringgrid1.RowCount+1;
 for i:= stringgrid2.row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 if stringgrid2.RowCount=2 then bit.Enabled := false;
end;

procedure TForm_mod73.N6Click(Sender: TObject);
begin
 try
  form_details:= tform_details.Create(application);
  Form_details.GetData(strtoint(stringgrid2.Cells[11,stringgrid2.row]));
  Form_details.ShowModal;
 finally
  Form_details.Free;
 end;

end;

procedure TForm_mod73.N8Click(Sender: TObject);
begin
 Remark_mod73:=TRemark_mod73.Create(Application);
 self.edit_note1060(stringgrid1.Cells[0,stringgrid1.row],Stringgrid1.Cells[11,stringgrid1.row]);
end;

procedure TForm_mod73.pmMainPopup(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
  n4.Enabled:=false;
 end
else
 begin
  n1.Enabled:=true;
  n2.Enabled:=true;
  n4.Enabled:=true;
 end;
end;

procedure TForm_mod73.pmZDPopup(Sender: TObject);
begin
if stringgrid2.Row=stringgrid2.RowCount-1 then
 begin
  n5.Enabled:=false;
  n6.Enabled:=false;
  n8.Enabled:=false;
 end
else
 begin
  n5.Enabled:=true;
  n6.Enabled:=true;
  n8.Enabled:=true;
 end;
end;



procedure TForm_mod73.StringGrid1Click(Sender: TObject);
 begin
 if ((StringGrid1.RowCount>=2) and (Trim(StringGrid1.Cells[0,stringgrid1.row])<>'')) then
 begin
  getdataremark(Trim(Stringgrid1.Cells[11,stringgrid1.row]));
 end;
 end;
procedure TForm_mod73.StringGrid1DblClick(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then Exit else bit.Enabled :=True;
 N1Click(Sender);
end;

procedure TForm_mod73.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (chr(key)='S') and (ssalt in shift) then
  showmessage(cdsMain.CommandText);

end;

procedure TForm_mod73.StringGrid2Click(Sender: TObject);
 begin
  if ((StringGrid2.RowCount>=2) and (Trim(StringGrid2.Cells[0,stringgrid2.row])<>'')) then
  begin
   getdataremark(Trim(StringGrid2.Cells[11,StringGrid2.row]));
  end;
  end;

procedure TForm_mod73.StringGrid2DblClick(Sender: TObject);
 begin
if stringgrid2.Row=stringgrid2.RowCount-1 then Exit;
 N5Click(Sender);

end;

procedure TForm_mod73.bitClick(Sender: TObject);
var
 so60kry,so60:string;
 i:integer;
 v_date:tdatetime;
begin
 if not gFunc.CheckUserAuth(2,73) then  Exit;
 if StringGrid2.RowCount<=2 then Exit ;
 for i:=1 to stringgrid2.RowCount-2 do
 begin
  so60:=so60+ stringgrid2.Cells[11,i]+',';
 end;
 so60kry:=Copy(so60,1,Length(so60)-1);
 getdataedit(so60kry);

 with ClientDataSet1 do
 if not IsEmpty then
 begin
  First;
  while not ClientDataSet1.Eof do
  begin
   if (fieldvalues['status']=2) or (fieldvalues['status']=3) or (fieldvalues['prod_rel']=2) then
   begin
    showmessage('销售订单:'+fieldvalues['sales_order']+'已被暂缓或关闭确认无效,请移除此条数据!');
    Exit;
   end;
   Next;
  end;
 end
 else Exit;

 ClientDataSet1.First;
 while not ClientDataSet1.Eof do
 begin
  ClientDataSet1.edit;
  ClientDataSet1.fieldvalues['conf_date'] := gFunc.GetSvrDateTime(); //长日期格式
  ClientDataSet1.fieldvalues['prod_rel'] := '2';  //使成为确认
  ClientDataSet1.fieldvalues['conf_by_empl_ptr'] := StrToInt(gvar.rkey05);
  ClientDataSet1.fieldvalues['to_be_confirmed'] := 0;
  ClientDataSet1.post;
  ClientDataSet1.Next;
 end;
 gSvrIntf.IntfPostDataByTable('data0060', ClientDataSet1.Delta);
 StringGrid2.RowCount:=2;
 StringGrid2.Rows[StringGrid2.Row].Clear;
 StringGrid2.Rows[StringGrid2.Row+1].Clear;
end;
end.
