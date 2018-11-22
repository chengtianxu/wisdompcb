unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids,Clipbrd,
  ComCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PopupMenu2: TPopupMenu;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    N5: TMenuItem;
    BitBtn6: TBitBtn;
    N6: TMenuItem;
    N7: TMenuItem;
    design_report: TPopupMenu;
    MI1: TMenuItem;
    ECN1: TMenuItem;
    N8: TMenuItem;
    C1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    TreeView1: TTreeView;
    Panel3: TPanel;
    TreeView2: TTreeView;
    TreeView3: TTreeView;
    Edit21: TEdit;
    M1: TMenuItem;
    N11: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure MI1Click(Sender: TObject);
    procedure ECN1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);

  private
    { Private declarations }
   PreColumn: TColumn;
   sql_text:tstringlist;
   OldGridWnd : TWndMethod;
   rkey08,sales_flag,rkey10,rkey25,rkey15 :integer;
   procedure NewGridWnd (var Message : TMessage);
   procedure item_click(sender:TObject);
   function find_error():boolean;
   function find_allerror(rkey25:integer):boolean;
   function find_rkey278(rkey278:integer;link_database:string):integer;
   function find_rkey34(rkey34: integer;link_database:string): integer;
   function set_lock(rkey25:integer;modal:byte):boolean;  //modal：1编辑
   procedure get_treedate(rkey25:integer;treeview:Ttreeview);
   function get_date0025toprkey(rkey25: integer):integer;
   function getparent_ptr(node: TTreeNode): integer;
   procedure CopyStandar(Sender: TObject);
   procedure UPDATEDATA0025(RKEY:integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, term, product_MIDetail, append_productin, copy_product,
     report_data, reportselect, report_data1, DB, ADODB,
  quality_trace, product_search, EditGlobalParameter;

{$R *.dfm}

function TForm1.set_lock(rkey25:integer;modal:byte):boolean;  //modal：1编辑
var
 table_name:string;
begin
 result:=false;
 table_name:='##d25_'+inttostr(rkey25);
 with dm.aqtmp do
  begin
   Close;
   SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
     ' select data0073.USER_FULL_NAME from '+table_name+' inner join data0073 on'+#13+
     table_name+'.rkey73=data0073.rkey'+#13+
     ' else select top 0 * from data0025 ';
   Open;
   if not isempty then
    messagedlg('当前记录被用户:'+fieldbyname('USER_FULL_NAME').AsString+'锁定,无法操作!',mtwarning,[mbok],0)
   else
    begin
     if modal=1 then  //如果为编辑则创建表,插入锁定的创建的系统用户
      begin
       close;
       SQL.Text:='select '+rkey73+'as rkey73 into '+table_name;
       execsql;
      end;
     result:=true;
    end;
  end;
end;

function TForm1.getparent_ptr(node: TTreeNode): integer;
var parent_code:TTreeNode;
begin
 parent_code:=node.Parent;
 result:=Pinteger(parent_code.data)^;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
  exit;  
 end; {}
 self.caption:=application.Title;

{ rkey73:='3';
 vprev:='4';     { }
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else OldGridWnd(Message);
end;

procedure tform1.item_click(sender:TObject);
var i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

function TForm1.find_error: boolean;
begin
result:=false;

if trim(dm.AQY0025MANU_PART_NUMBER.Value)='' then
 begin
  messagedlg('本厂编号不允许为空!',mterror,[mbcancel],0);
  result:=true;
  exit;
 end;
 
if trim(dm.AQY0025MANU_PART_DESC.Value)='' then
 begin
  messagedlg('客户型号不允许为空!',mterror,[mbcancel],0);
  result:=true;
  exit;
 end;

if dm.AQY0025PARENT_PTR.Value > 0 then
begin
 if dm.AQY0025QTY_BOM.Value <= 0 then
 begin
  messagedlg(dm.AQY0025MANU_PART_NUMBER.Value+'压合比例分子输入有误!',mterror,[mbcancel],0);
  result:=true;
  exit;
 end;

 if dm.AQY0025QTY_PARENTBOM.Value <= 0 then
 begin
  messagedlg(dm.AQY0025MANU_PART_NUMBER.Value+'压合比例分母输入有误!',mterror,[mbcancel],0);
  result:=true;
  exit;
 end;

 if dm.AQY0025BOM_STEP.Value<=0 then
 begin
  messagedlg(dm.AQY0025MANU_PART_NUMBER.Value+'压合步骤输入有误!',mterror,[mbcancel],0);
  result:=true;
  exit;
 end
 else
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT Data0038.STEP_NUMBER, dbo.Data0034.DEPT_CODE,'+#13+
        'Data0034.DEPT_NAME, Data0034.BARCODE_ENTRY_FLAG'+#13+
         'FROM Data0038 INNER JOIN'+#13+
        'dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
        'where data0038.SOURCE_PTR='+dm.AQY0025PARENT_PTR.AsString+#13+
        'and Data0038.STEP_NUMBER='+dm.AQY0025BOM_STEP.AsString+#13+
        'and data0034.IS_COST_DEPT=1 and data0034.BARCODE_ENTRY_FLAG=''Y''';
    open;
   end;
  if dm.ADOQuery1.IsEmpty then
  begin
   messagedlg(dm.AQY0025MANU_PART_NUMBER.Value+'压合步骤输入有误,步骤号在父层中没有找到对应的工序!',mterror,[mbcancel],0);
   result:=true;
   exit;
  end
 end;
end;


if (dm.AQY0025SO_UNIT.Value='无要求') or
   (trim(dm.AQY0025SO_UNIT.Value)='') then
 begin
  messagedlg('没有确定最终交货形式!',mterror,[mbcancel],0);
  result:=true;
  exit;
 end;

 dm.ads279.close;                           //全局参数
 dm.ads279.Parameters[0].Value:=dm.AQY0025RKEY.Value;
 dm.ads279.Open;
if dm.ads279.IsEmpty then
begin
 messagedlg(dm.AQY0025MANU_PART_NUMBER.Value+'还没有输入全局参数!',mterror,[mbcancel],0);
 result:=true;
 dm.ads279.close;
 exit;
end
else
while not dm.ads279.Eof do
 begin
  if (dm.ads279status3.Value=1) and
    (trim(dm.ads279PARAMETER_VALUE.Value)='') then
  begin
   messagedlg(dm.AQY0025MANU_PART_NUMBER.Value+'全局参数为不允许为空的重要参数!',mterror,[mbcancel],0);
   result:=true;
   dm.ads279.close;
   exit;
  end;
  dm.ads279.Next;
 end;
 dm.ads279.close;

 dm.ads494.Close;                      //制程参数
 dm.ads494.Parameters[0].Value:=dm.AQY0025RKEY.Value;
 DM.ads494.Open;
 dm.ads494.Filter:='';
while not dm.ads494.Eof do
begin
 if (dm.ads494flow_spfc_flag.Value='Y') and     // 重点参数
    (dm.ads494after_flag.Value<>'Y') and       //不是后补参数
    (trim(dm.ads494PARAMETER_VALUE.Value)='') then   //参数为空
 begin
  messagedlg('第'+DM.ads494step_number.AsString+'步制程参数为不允许为空的重要参数!',
           mterror,[mbcancel],0);
  result:=true;
  dm.ads494.Close;
  exit;
 end;
 dm.ads494.Next;
end;
dm.ads494.Close;

end;

function TForm1.find_allerror(rkey25:integer): boolean;
begin
 result:=false;
with dm.ADOQuery3 do                      //第二层
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              inttostr(rkey25);
  open;
  while not dm.ADOQuery3.Eof do
  begin
   dm.AQY0025.Close;
   dm.AQY0025.Parameters[0].Value:=dm.ADOQuery3.FieldValues['rkey'];
   dm.AQY0025.Open;
   if not self.find_error then
    with dm.ADOQuery2 do         //第三层
    begin
     close;
     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              dm.ADOQuery3.fieldbyname('rkey').AsString;
     open;
     while not dm.ADOQuery2.Eof do
     begin
      dm.AQY0025.Close;
      dm.AQY0025.Parameters[0].Value:=dm.ADOQuery2.FieldValues['rkey'];
      dm.AQY0025.Open;
      if not self.find_error then
       with dm.ADOQuery4 do         //第四层
        begin
         close;
         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
                  dm.ADOQuery2.fieldbyname('rkey').AsString;
         open;
         while not dm.ADOQuery4.Eof do
         begin
          dm.AQY0025.Close;
          dm.AQY0025.Parameters[0].Value:=dm.ADOQuery4.FieldValues['rkey'];
          dm.AQY0025.Open;
          if self.find_error then
           begin
            result:=true;
            break;
           end;
          dm.ADOQuery4.Next;
         end;
        end
      else
       begin
         result:=true;
         break;
       end;
      dm.ADOQuery2.Next;
     end;
    end
   else
    begin
     result:=true;
     break;
    end;
   dm.ADOQuery3.Next;
  end;
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption)
end;

procedure TForm1.FormShow(Sender: TObject);
var i:byte;
    item:TMenuItem;
begin


 if dm.ADOConnection1.Connected then
 begin
   PreColumn := DBGrid1.Columns[0];
   dm.ADS25.Close;
   dm.ADS25.Parameters.ParamByName('dtpk1').Value:= Now-90; //getsystem_date(dm.adoquery1,1)-90;
   dm.ADS25.Parameters.ParamByName('dtpk2').Value:= Now;//  getsystem_date(dm.adoquery1,1);
   dm.ADS25.Prepared;
   dm.ADS25.Open;
   sql_text:=tstringlist.Create;
   sql_text.Text := dm.ADS25.CommandText;

   for i:=1 to dbgrid1.FieldCount do
    begin
     item:=TmenuItem.Create(self);
     item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
     if dbgrid1.Columns[i-1].Visible then
      item.Checked:=true;
     item.OnClick := item_click;
     self.PopupMenu2.Items.Add(item);
    end;
   with dm.adoquery4 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    user_ptr:=fieldbyname('employee_ptr').asstring;
   end;
 end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then showmessage(dm.ADs25.CommandText);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
 PopupMenu2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.ADs25.IndexFieldNames) then
 dm.ADs25.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (PreColumn<>column) then
 begin
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADs25.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADs25.filter := '';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var rkey:integer;
begin
 rkey:=dm.ads25rKEY.Value;
 dm.ADS25.Close;
 dm.ADS25.Prepared;
 dm.ADS25.Open;
 if rkey>0 then dm.ADS25.Locate('rkey',rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var i:byte;
begin
 form_condition.dtpk1.Date:=dm.ADs25.Parameters.ParamValues['dtpk1'];
 form_condition.dtpk2.Date:=dm.ADs25.Parameters.ParamValues['dtpk2'];
 if form_condition.ShowModal=mrok then
 begin
  //ShowMessage(sql_text.Text);
  sql_text.Delete(22);
  sql_text.Delete(22);

  case  form_condition.ComboBox2.ItemIndex of
  0:begin
    sql_text.Insert(22,'where data0025.CUSTPART_ENT_DATE >=:dtpk1 and');
    sql_text.Insert(23,'data0025.CUSTPART_ENT_DATE-1 <=:dtpk2 and');
    end;
  1:begin
    sql_text.Insert(22,'where data0025.LAST_MODIFIED_DATE >=:dtpk1 and');
    sql_text.Insert(23,'data0025.LAST_MODIFIED_DATE-1 <=:dtpk2 and');
    end;
  2:begin
    sql_text.Insert(22,'where data0025.AUDITED_DATE >=:dtpk1 and');
    sql_text.Insert(23,'data0025.AUDITED_DATE-1 <=:dtpk2 and');
    end;
  end;

  dm.ADs25.Close;
  dm.ADs25.CommandText:=sql_text.Text;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.ADs25.CommandText:=dm.ADs25.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  dm.ADs25.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.ADs25.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.ADS25.Prepared;
  dm.ADs25.Open;
 end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
dm.ADS25.Close;
if checkbox1.Checked then
 dm.ADS25.Parameters.ParamValues['v6']:=9
else
 dm.ADS25.Parameters.ParamValues['v6']:=6;

if checkbox2.Checked then
 dm.ADS25.Parameters.ParamValues['v0']:=9
else
 dm.ADS25.Parameters.ParamValues['v0']:=0;

if checkbox3.Checked then
 dm.ADS25.Parameters.ParamValues['v3']:=9
else
 dm.ADS25.Parameters.ParamValues['v3']:=3;

if checkbox4.Checked then
 dm.ADS25.Parameters.ParamValues['v4']:=9
else
 dm.ADS25.Parameters.ParamValues['v4']:=4;

if checkbox5.Checked then
 dm.ADS25.Parameters.ParamValues['v1']:=9
else
 dm.ADS25.Parameters.ParamValues['v1']:=1;

if checkbox6.Checked then
 dm.ADS25.Parameters.ParamValues['v5']:=9
else
 dm.ADS25.Parameters.ParamValues['v5']:=5;

if checkbox7.Checked then
 dm.ADS25.Parameters.ParamValues['v2']:=9
else
 dm.ADS25.Parameters.ParamValues['v2']:=2;
  dm.ADS25.Prepared;
dm.ADS25.Open;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 rkey:integer;
 table_name:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if set_lock(dm.ADS25rkey.Value,1) then  //锁定成功
begin
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value := dm.ADS25rkey.Value;
 dm.AQY0025.Open;
 table_name:='##d25_'+dm.ADS25rkey.AsString;
 if dm.AQY0025TSTATUS.Value=dm.ads25TSTATUS.Value then
  try
   application.CreateForm(tForm2,Form2);
   dm.AQY0025.Edit;
   dm.AQY0025LAST_MODIFIED_DATE.Value := getsystem_date(dm.adoquery1,0);
   dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
   dm.AQY0025TSTATUS.Value:=0;
   if form2.ShowModal=mrok then
    begin
     rkey:=dm.ADS25rkey.Value;
     dm.ADS25.Close;
     dm.ADS25.Prepared;
     dm.ADS25.Open;
     if rkey > 0 then dm.ADS25.Locate('rkey',rkey,[]);
    end;

    with dm.aqtmp do   //无论保存或退出都删除锁定的记录
     begin
      Close;
      SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
        ' drop table '+table_name;
      execsql;
     end;

  finally
   form2.free;
  end
 else
  messagedlg('状态发生变更不能编辑',mtinformation,[mbcancel],0);
end;

end;

procedure TForm1.N2Click(Sender: TObject);
begin
try
 application.CreateForm(tForm2,Form2);
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
 form2.status.Caption:='1'; //代表检查
 if form2.ShowModal=mrok then
  begin

  end;
finally
 form2.free;
end
end;

procedure TForm1.N3Click(Sender: TObject);
var
 ENG_CONTROL:byte;
 infor:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if set_lock(dm.ADS25rkey.Value,0) then  //未锁定
begin
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
 if dm.AQY0025TSTATUS.Value=dm.ads25TSTATUS.Value then
  begin
   if not self.find_error then     //查找首层线路错误数据
   if not self.find_allerror(dm.AQY0025RKEY.Value) then  //查找内层错误数据
    begin
     with dm.ADOQuery1 do
      begin
       close;
       sql.Text:='SELECT ENG_CONTROL1 FROM dbo.Data0192';
       open;
       ENG_CONTROL:=fieldbyname('ENG_CONTROL1').AsInteger;
      end;
     dm.AQY0025.Close;
     dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
     dm.AQY0025.Open;
     dm.AQY0025.Edit;
     if ENG_CONTROL=0 then     //提交后无需工程检查直接进入待审核
      dm.AQY0025TSTATUS.Value:=4
     else                      //提交后需要先进入待检查状态
      dm.AQY0025TSTATUS.Value:=3;
     dm.AQY0025ALLOW_EDIT_FLAG.Value:='N';
     dm.AQY0025.Post;
     //---提交前提示与此产品拼版尺寸或交货尺寸相同的产品，工程做防呆设计
     dm.ads279.close;   //全局参数
     dm.ads279.Parameters[0].Value:=dm.AQY0025RKEY.Value;
     dm.ads279.Open;
     application.CreateForm(Tform2,form2);
     infor:='';
     if dm.AQY0025ttype.Value=0 then  //量产板才做防呆检查
      if form2.find_setpnlmin(infor) then
       showmsg('产品:'+infor+'与本产品拼版尺寸相同或交货尺寸非常接近，建议增加工程防呆设计！',1);
      if infor<>'' then
       begin
        infor:= '产品:'+infor+'与本产品拼版尺寸相同或交货尺寸非常接近，建议增加工程防呆设计!';
        clipboard.Clear;
        Clipboard.AsText:=infor;
       end;
     form2.Free;
     dm.ads279.close;
     dm.AQY0025.Close;
     bitbtn3click(sender);
    end;
   end
   else
    begin
     messagedlg('状态发生变更不能提交!',mtinformation,[mbcancel],0);
     dm.AQY0025.Close;
    end;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if set_lock(dm.ADS25rkey.Value,0) then  //未锁定
begin
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
  if dm.AQY0025TSTATUS.Value=dm.ads25TSTATUS.Value then
   begin
     dm.AQY0025.Close;
     dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
     dm.AQY0025.Open;
     dm.AQY0025.Edit;
     dm.AQY0025TSTATUS.Value:=6;
     dm.AQY0025ONHOLD_SALES_FLAG.Value:=0;
     dm.AQY0025.Post;
     bitbtn3click(sender);
   end
  else
   messagedlg('状态发生变更不能退回!',mtinformation,[mbcancel],0);
end;

end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
 design_report.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
form_reportselect:=tform_reportselect.Create(application);
if form_reportselect.ShowModal=mrok then
 begin
  form_report:=tform_report.Create(application);
  with form_report do
  begin
    ppReport1.Reset;
   { ppReport1.Template.FileName :=
     'D:\vss文档\原程序代码\工程设计\产品设计\产品MI设计fpc\Manu_instruction.rtm'; {}

    ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'Manu_instruction_FPC.rtm';     {}      //R:\NIERP\Report\Manu_instruction.rtm

    ppReport1.Template.LoadFromFile;
    ppreport1.SaveAsTemplate:=false;

   ads192.Open;
   ads279.Close;
   ads279.Parameters.ParamValues['rkey']:=dm.ADS25rkey.Value;
   if ads192ENG_CONTROL16.Value=1 then       //不显示为空的全局参数
    ads279.Parameters.ParamValues['value']:=''
   else
    ads279.Parameters.ParamValues['value']:='#@#@#';
   ads279.Open;

   ads25.Close;
   ads25.Parameters[0].Value:=dm.ADS25rkey.Value;
   ads25.Open;

   ads494.Close;
   ads494.Parameters.ParamValues['source_ptr']:=dm.ADS25rkey.Value;
   if ads192ENG_CONTROL2.Value=1 then       //不显示为空的制程参数
    ads494.Parameters.ParamValues['value']:=''
   else
    ads494.Parameters.ParamValues['value']:='#@#@#';
   ads494.Open;

   ads38.Close;
   ads38.Parameters.ParamValues['rkey']:=dm.ADS25rkey.Value;
   if form_reportselect.CheckBox3.Checked then
    ads38.Parameters.ParamValues['visible']:=1
   else
    ads38.Parameters.ParamValues['visible']:=2;
   ads38.Open;
   ads502.Open;
   ads29.Open;
   form_report.ppImage3.Picture.Assign(Load_JPG_Pic_From_DB(ads502DSDesigner));
   if ads502A3.Value>0 then
    form_report.ppimage1.Picture.Assign(Load_JPG_Pic_From_DB(ads502A));
 //  if ads502B3.Value>0 then
   if ads502B.AsVariant <> null then
    form_report.ppimage2.Picture.Assign(Load_JPG_Pic_From_DB(ads502B));

   if not form_reportselect.CheckBox1.Checked then
    form_report.ppSubReport1.Visible:=false;
   if not form_reportselect.CheckBox2.Checked then
    form_report.ppSubReport2.Visible:=false;
   if not form_reportselect.CheckBox4.Checked then
    form_report.ppSubReport3.Visible:=false;
   if not form_reportselect.CheckBox5.Checked then
    form_report.ppSubReport4.Visible:=false;
  end;

  form_report.ppReport1.Print;
  form_report.Free;
 end;
form_reportselect.Free;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=false;
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
  n8.Enabled:=false;
  n7.Enabled:=false;
  c1.Enabled:=false;
  n9.Enabled:=false;
  N10.Enabled:=false;
  M1.Enabled:=false;

case dm.ADS25TSTATUS.Value of
6:
 begin
  n2.Enabled:=true;
  n7.Enabled:=true;
 end;
0:
 begin
  n1.Enabled:=true;
  n2.Enabled:=true;
  n3.Enabled:=true;
  n4.Enabled:=true;
  n5.Enabled:=true;
  n6.Enabled:=true;
  n8.Enabled:=true;
  n7.Enabled:=true;
  c1.Enabled:=true;
   M1.Enabled:=true;
 end;
3:
 begin
  n2.Enabled:=true;
  n6.Enabled:=true;
  n8.Enabled:=true;
  n7.Enabled:=true;
 end;
4:
 begin
  n2.Enabled:=true;
  n6.Enabled:=true;
  n8.Enabled:=true;
  n7.Enabled:=true;
 end;
1:
 begin
  n2.Enabled:=true;
  n6.Enabled:=true;
  n8.Enabled:=true;
  n7.Enabled:=true;
  N9.Enabled:=true;
  n10.Enabled:=((N9.Enabled) and (dm.ADS25quality_status.Value=false));
 end;
5:
 begin
  n1.Enabled:=true;
  n2.Enabled:=true;
  n5.Enabled:=true;
  n6.Enabled:=true;
  n8.Enabled:=true;
  n7.Enabled:=true;
 end;
2:
 begin
  n1.Enabled:=true;
  n2.Enabled:=true;
  n5.Enabled:=true;
  n6.Enabled:=true;
  n8.Enabled:=true;
  n7.Enabled:=true;
 end;
end;

if dm.ADS25.IsEmpty then
begin
  n1.Enabled:=false;
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
  n8.Enabled:=false;
  n7.Enabled:=false;
  c1.Enabled:=false;
  N9.Enabled:=false;
  N10.Enabled:=false;
   M1.Enabled:=false;
end;
  N11.Enabled := N1.Enabled;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (dm.ADS25TSTATUS.Value=5) or
    (dm.ADS25TSTATUS.Value=2) then
  DBGrid1.Canvas.Font.Color := clred
 else
  if (dm.ADS25TSTATUS.Value=6) then
   DBGrid1.Canvas.Font.Color := cllime;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
  if (dm.ADS25TSTATUS.Value=5) or (dm.ADS25TSTATUS.Value=2) then
  N7Click(sender);
 if (dm.ADS25TSTATUS.Value=0) then
  N1Click(sender);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
 with dm.ADOQuery1 do
 begin
  close;
   sql.Text:='select FILE_POINTER,SOURCE_TYPE,memo_text,NOTE_PAD_LINE_1 from data0011'+#13+
             'where SOURCE_TYPE=25 and'+#13+
             'FILE_POINTER='+dm.ADS25rkey.AsString;
  open;
  if not isempty then
  messagedlg('备注如下:'+#13+fieldbyname('memo_text').AsString+#13+
                             fieldbyname('NOTE_PAD_LINE_1').AsString,
                             mtinformation,[mbok],0);
 end;
end;

procedure TForm1.MI1Click(Sender: TObject);
begin
 form_report:=tform_report.Create(application);

 form_report.ppReport1.Reset;
 form_report.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'Manu_instruction_FPC.rtm';
 form_report.ppReport1.Template.LoadFromFile;
 form_report.ppReport1.SaveAsTemplate := true;

 form_report.ppDesigner1.ShowModal;
 form_report.Free;
end;

procedure TForm1.ECN1Click(Sender: TObject);
begin
 form_report1:=tform_report1.Create(application);
 form_report1.ppDesigner1.ShowModal;
 form_report1.Free;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  Form_report1:=TForm_report1.Create(application);
  with form_report1 do
  begin
   aq35.Close;
   aq35.Parameters[0].Value:=dm.ADS25rkey.Value;
   aq35.Open;
   ppreport1.Print;
  end;
  form_report1.Free;
end;

function TForm1.find_rkey278(rkey278: integer;link_database:string): integer;
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Text:='select rkey from data0278 where PARAMETER_NAME='+
           '(select PARAMETER_NAME from '+link_database+'dbo.data0278 '+
           'where rkey='+inttostr(rkey278)+')';
  open;
  if IsEmpty then
   result:=0
  else
   result:=fieldbyname('rkey').AsInteger;
 end;
end;

function TForm1.find_rkey34(rkey34: integer;link_database:string): integer;
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Text:='select rkey from data0034 where DEPT_CODE='+
           '(select DEPT_CODE from '+link_database+'dbo.data0034 '+
           'where rkey='+inttostr(rkey34)+')';
  open;
  if IsEmpty then
   result:=0
  else
   result:=fieldbyname('rkey').AsInteger;
 end;
end;

procedure TForm1.C1Click(Sender: TObject);
var
 i,j:word;
 customer,parent,ttype,qty_hand,CREATED_ptr,warehouse_ptr:integer;
 PROD_PTR,LAYERS:integer;
 analysis_2,analysis_3,memo_text:string;
 CREATED_date:tdatetime;
 REPORT_UNIT_VALUE1,EST_SCRAP:Currency;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if set_lock(dm.ADS25rkey.Value,0) then  //未锁定
try
form3:=tform3.Create(application);

 if (sender as Tmenuitem).Tag=1 then
 with form3 do
  begin
   combobox2.Enabled:=true;
   bitbtn5.Enabled:=true;
  end;

if form3.ShowModal=mrok then
 begin
  dm.ADOConnection1.BeginTrans;
  screen.Cursor:=crappstart;
  try
  for i:=1 to form3.StringGrid1.RowCount-2 do
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select * from '+form3.link_database
         +'dbo.data0025 where rkey='+form3.StringGrid1.Cells[3,i];
    open;
   end;
  dm.AQY0025.Close;
  dm.AQY0025.Parameters[0].Value:=form3.StringGrid1.Cells[2,i];
  dm.AQY0025.Open;
  customer:=dm.AQY0025CUSTOMER_PTR.Value;
  parent:=dm.AQY0025PARENT_PTR.Value;
  warehouse_ptr:=dm.AQY0025PROD_ROUTE_PTR.Value; //工厂指针
  PROD_PTR:=dm.AQY0025PROD_CODE_PTR.Value;       //产品类型
  LAYERS:=dm.AQY0025LAYERS.Value;                //层数
  ttype:=dm.AQY0025ttype.Value;                  //产品属性
  qty_hand:=dm.AQY0025QTY_ON_HAND.Value;         //库存
  analysis_2:=dm.AQY0025ANALYSIS_CODE_2.Value;   //客户物料号
  analysis_3:=dm.AQY0025ANALYSIS_CODE_3.Value;   //大料规格
  memo_text:= dm.AQY0025memo_text.Value;         //市场备注
  CREATED_ptr:=dm.AQY0025CREATED_BY_EMPL_PTR.Value;  //创建人员
  CREATED_date:=dm.AQY0025CUSTPART_ENT_DATE.Value;   //创建日期
  REPORT_UNIT_VALUE1:=dm.AQY0025REPORT_UNIT_VALUE1.Value; //产品重量
  EST_SCRAP:=dm.AQY0025EST_SCRAP.Value;  //报废率
  dm.AQY0025.edit;
  for j:=3 to dm.AQY0025.FieldCount-4 do
   dm.AQY0025.Fields[j].Value := dm.ADOQuery1.FieldValues[dm.AQY0025.Fields[j].FieldName];

   dm.AQY0025PROD_ROUTE_PTR.Value:=warehouse_ptr;
   dm.AQY0025PROD_CODE_PTR.Value:=PROD_PTR;       //产品类型
   //dm.AQY0025LAYERS.Value:=LAYERS;
   dm.AQY0025CREATED_BY_EMPL_PTR.Value:=CREATED_ptr;
   dm.AQY0025CUSTPART_ENT_DATE.Value:=CREATED_date;
   dm.AQY0025ANALYSIS_CODE_2.Value:=analysis_2;
   dm.AQY0025ANALYSIS_CODE_3.Value:=analysis_3;
   dm.AQY0025memo_text.Value:=memo_text;           //市场备注
   dm.AQY0025REPORT_UNIT_VALUE1.Value := REPORT_UNIT_VALUE1; //单位重量
   dm.AQY0025LAST_MODIFIED_DATE.Value:=getsystem_date(dm.adoquery1,1);
   dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
   dm.AQY0025TSTATUS.Value:=0;
   dm.AQY0025CHECK_BY_PTR.AsVariant:=null;
   dm.AQY0025CHECK_DATE.AsVariant:=null;
   dm.AQY0025AUDITED_BY_PTR.AsVariant:=null;
   dm.AQY0025AUDITED_DATE.AsVariant:=null;
   dm.AQY0025ENG_ROUTE_PTR.AsVariant:=null;    //流程模型指针
   dm.AQY0025ALLOW_EDIT_FLAG.Value:='Y';       //允许编辑
   dm.AQY0025ONHOLD_SALES_FLAG.Value:=0;       //可以销售
   dm.AQY0025ONHOLD_RELEASE_FLAG.Value:=1;     //工单发出暂缓
   dm.AQY0025ONHOLD_PLANNING_FLAG.Value:=1;    //投产暂缓
   dm.AQY0025CUSTOMER_PTR.Value:=customer;     //客户指针
   dm.AQY0025EST_SCRAP.Value := EST_SCRAP;  //报废率
   if parent>0 then
    dm.AQY0025PARENT_PTR.Value:=parent
   else
    dm.AQY0025PARENT_PTR.AsVariant:=null;
   dm.AQY0025ttype.Value:=ttype;
   dm.AQY0025QTY_ON_HAND.Value:=qty_hand;
   dm.AQY0025.Post;

   dm.ads502.Close;      //拼版图
   dm.ads502.Parameters[0].Value:=form3.StringGrid1.Cells[2,i];
   dm.ads502.Open;
   if not dm.ads502.IsEmpty then dm.ads502.Delete;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select * from '+form3.link_database
    +'dbo.data0502 where source_ptr='+form3.StringGrid1.Cells[3,i];
    open;
   end;
   if not dm.ADOQuery1.IsEmpty then
    begin
     dm.ads502.Append;
     for j:=1 to 22 do
     dm.ads502.Fields[j].Value:=dm.ADOQuery1.FieldValues[dm.ads502.Fields[j].FieldName];
     dm.ads502source_ptr.Value:= strtoint(form3.StringGrid1.Cells[2,i]);
     dm.ads502.Post;
     dm.ads502.UpdateBatch();
    end;

   dm.ads279.close;
   dm.ads279.Parameters[0].Value:=form3.StringGrid1.Cells[2,i];
   dm.ads279.Open;
   while not dm.ads279.Eof do dm.ads279.Delete;
   with dm.ADOQuery1 do      //全局参数
   begin
    close;
    sql.Text:='select data0279.PARAMETER_PTR, data0279.PARAMETER_VALUE ,'+#13+
      'data0279.IES_PROD,data0279.IES_CRP,data0278.status4'+#13+
      'from '+form3.link_database+'dbo.data0279 inner join '+
       form3.link_database+'dbo.data0278'+#13+
      'on data0279.PARAMETER_PTR=data0278.rkey'+#13+
      'where data0279.IES_PROD=1 and'+#13+
      'data0279.source_ptr='+form3.StringGrid1.Cells[3,i]+#13+
      'order by data0279.IES_CRP';
    open;
    if not isempty then
    begin
     while not eof do
     begin
     dm.ads279.Append;
     for j:=1 to 4 do
      dm.ads279.Fields[j].Value := FieldValues[dm.ads279.Fields[j].FieldName];
     dm.ads279source_PTR.Value := strtoint(form3.StringGrid1.Cells[2,i]);
     if (sender as Tmenuitem).Tag=1 then
     dm.ads279PARAMETER_PTR.Value:=
      self.find_rkey278(Fieldbyname('PARAMETER_PTR').AsInteger,form3.link_database);

     if fieldbyname('status4').AsInteger=1 then
      dm.ads279PARAMETER_VALUE.Value:='';
      next;
     end;
     dm.ads279.UpdateBatch();
    end;
   end;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update data0279'+#13+
      'set PARAMETER_VALUE='''' '+#13+
      'FROM  dbo.Data0279 INNER JOIN'+#13+
      'dbo.Data0278 ON dbo.Data0279.PARAMETER_PTR = dbo.Data0278.RKEY'+#13+
      'WHERE  (dbo.Data0278.STATUS4 = 1) and (data0279.IES_PROD=1)'+#13+
      ' and   data0279.source_ptr='+form3.StringGrid1.Cells[2,i];
    ExecSQL;
   end;

   dm.ADS38.Close;                         //打开工艺流程
   dm.ADS38.Parameters[0].Value:=form3.StringGrid1.Cells[2,i];
   dm.ADS38.Open;
   while not dm.ADS38.Eof do dm.ADS38.Delete;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER,'+#13+
              'tooling_rev,OUTP_SPFC,tool_old_rev FROM '+form3.link_database+'dbo.Data0038'+#13+
      'where source_ptr='+form3.StringGrid1.Cells[3,i]+#13+
      'order by step_number';
    open;
    if not isempty then
    begin
     while not eof do
     begin
      dm.ADS38.Append;
      for j:=1 to 6 do
       dm.ADS38.Fields[j].Value:=FieldValues[dm.ADS38.Fields[j].FieldName];
      dm.ADS38SOURCE_PTR.Value:=strtoint(form3.StringGrid1.Cells[2,i]);
      if (sender as Tmenuitem).Tag=1 then
      dm.ADS38DEPT_PTR.Value:=
       self.find_rkey34(Fieldbyname('DEPT_PTR').AsInteger,form3.link_database);
      next;
     end;
     dm.ADS38.UpdateBatch();
    end;
   end;

   dm.ads494.Close;                      //制程参数
   dm.ads494.Parameters[0].Value:=form3.StringGrid1.Cells[2,i];
   DM.ads494.Open;
   dm.ads494.Filter:='';
   while not dm.ads494.Eof do dm.ads494.Delete;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT Data0494.PARAMETER_PTR, Data0494.PARAMETER_VALUE,'+#13+
    'Data0494.custpart_ptr,Data0494.step_number,Data0494.seq_no,Data0494.Doc_Flag,'+#13+
    'Data0494.after_flag, Data0494.flow_spfc_flag,data0278.status4'+#13+
    'FROM '+form3.link_database+'dbo.Data0494 inner join '+
    form3.link_database+'dbo.data0278'+#13+
    'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
    'where Data0494.custpart_ptr = '+form3.StringGrid1.Cells[3,i]+#13+
    'order by Data0494.step_number,Data0494.seq_no';
    open;
    if not isempty then
    begin
     while not eof do
     begin
      dm.ads494.Append;
      for j:=0 to 7 do
       dm.ads494.Fields[j].Value:=FieldValues[dm.ads494.Fields[j].FieldName];
      dm.ads494custpart_ptr.Value:= strtoint(form3.StringGrid1.Cells[2,i]);
      if (sender as Tmenuitem).Tag=1 then
      dm.ads494PARAMETER_PTR.Value:=
       self.find_rkey278(Fieldbyname('PARAMETER_PTR').AsInteger,form3.link_database);
      if fieldbyname('status4').AsInteger=1 then
       dm.ads494PARAMETER_VALUE.Value:='';
      next;
     end;
     dm.ads494.UpdateBatch();
    end;
   end;

   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update data0494'+#13+
      'set PARAMETER_VALUE='''' '+#13+
      'FROM  dbo.data0494 INNER JOIN'+#13+
      'dbo.Data0278 ON dbo.data0494.PARAMETER_PTR = dbo.Data0278.RKEY'+#13+
      'WHERE  (dbo.Data0278.STATUS4 = 1)'+#13+
      ' and   data0494.custpart_ptr='+form3.StringGrid1.Cells[2,i];
    ExecSQL;
   end;     //清除制程参数中不需要复制的部份

   with dm.ADOQuery2 do     //29 钻咀表
   begin
    close;
    sql.Text:=
    'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
    'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
    'FROM dbo.Data0029'+#13+
    'where source_ptr ='+form3.StringGrid1.Cells[2,i];
    open;
    while not eof do delete;
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:=
    'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
    'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
    'FROM '+form3.link_database+'dbo.Data0029'+#13+
    'where source_ptr='+form3.StringGrid1.Cells[3,i];
    open;
    while not eof do
     begin
      dm.ADOQuery2.Append;
       for j:=1 to 12 do
       dm.adoquery2.Fields[j].Value:=FieldValues[dm.adoquery2.Fields[j].FieldName];
      dm.ADOQuery2.FieldValues['SOURCE_PTR']:= strtoint(form3.StringGrid1.Cells[2,i]);
      dm.ADOQuery2.Post;
      next;
     end;

   end;

  with dm.ADOQuery2 do  //---复制ecn履历表 -andy 08-11-14
  begin
   close;
   sql.Text:=
   'SELECT part_ptr,serial_no,part_number,text,source,if_gerber,'+#13+
   'create_employee,engineer,ecn_no,enter_date'+#13+
   'FROM dbo.Data0035'+#13+
   'where part_ptr ='+form3.StringGrid1.Cells[2,i];
   open;
   while not eof do delete;
  end;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
   'SELECT part_ptr,serial_no,part_number,text,source,if_gerber,'+#13+
   'create_employee,engineer,ecn_no,enter_date'+#13+
   'FROM '+form3.link_database+'dbo.Data0035'+#13+
   'where part_ptr ='+form3.StringGrid1.Cells[3,i];
   open;
   while not eof do
   begin
    dm.ADOQuery2.Append;
    for j:=1 to 9 do
     dm.adoquery2.Fields[j].Value:=FieldValues[dm.adoquery2.Fields[j].FieldName];
    dm.ADOQuery2.FieldValues['part_ptr']:= strtoint(form3.StringGrid1.Cells[2,i]);
    dm.ADOQuery2.Post;
    next;
   end;
  end;      

  end;

  dm.ADOConnection1.CommitTrans;
  dm.ads502.Close;
  dm.AQY0025.Close;
  dm.ads279.Close;
  dm.ADS38.Close;
  dm.ads494.Close;
  dm.ADS279_0.Close;
  messagedlg('数据复制成功!',mtinformation,[mbok],0);
  bitbtn3click(sender);
  screen.Cursor:=crdefault;
 except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   screen.Cursor:=crdefault;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
 end;

 end;
finally
form3.Free;
end;
end;



procedure TForm1.N9Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
try
 application.CreateForm(tForm5,Form5);
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
 dm.AQY0025.Open;
if form5.ShowModal=mrok then
begin
end;
finally
 form5.free;
end
end;
end;

procedure TForm1.N10Click(Sender: TObject);
var
i,rkey0025:integer;
node:ttreenode;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
TreeView1.Items.Clear;
self.get_treedate(dm.ADS25rkey.Value,treeview1);
node:=TreeView1.Items.Item[0];
rkey0025:=0;
for i:=0 to TreeView1.Items.Count-1 do
begin
TreeView1.Select(node);
dm.ADO31.Close;
dm.ADO31.Parameters[0].Value:=Pinteger(TreeView1.Items.Item[i].data)^;
dm.ADO31.Open;
if dm.ADO31.IsEmpty then
begin
rkey0025:=Pinteger(TreeView1.Items.Item[i].data)^;
break;
end;
end;
if rkey0025<>0 then
begin
with dm.ADOQuery1 do
begin
close;
sql.Text:='select MANU_PART_NUMBER from data0025 where rkey='+inttostr(rkey0025);
open;
end;
showmessage('产品'+dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString+'还没有品质跟踪信息！');
end
else
begin                              
  dm.AQY0025.Close;
  dm.AQY0025.Parameters[0].Value:=dm.ADS25rkey.Value;
  dm.AQY0025.Open;
  dm.AQY0025.Edit;
  dm.AQY0025quality_status.Value:=true;
  dm.AQY0025quality_user.Value:=strtoint(user_ptr);
  dm.AQY0025quality_date.Value:=common.getsystem_date(dm.ADOQuery1,0);
  dm.AQY0025.Post;
  BitBtn3Click(Sender);
  showmessage('产品品质跟踪信息提交成功！');
end;
end;
end;

function TForm1.get_date0025toprkey(rkey25: integer):integer;
var
 rkey:integer;
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey25);
  open;
  rkey := fieldbyname('parent_ptr').AsInteger; //等于父值
 end;

 if rkey <= 0 then
  rkey:=rkey25       //如果产品顶层等于自己
 else
  with dm.ADOQuery2 do
  begin
   close;
   sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
   open;
   if FieldByName('parent_ptr').AsInteger > 0 then
    begin
     rkey := fieldbyname('parent_ptr').AsInteger;  //如果有爷爷等于爷爷值
     with dm.ADOQuery3 do
      begin
       close;
       sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
       open;
       if FieldByName('parent_ptr').AsInteger > 0 then
         rkey := fieldbyname('parent_ptr').AsInteger;  //如果有太公等于太公值
      end;
    end;
  end;
 result:=rkey;
end;

procedure TForm1.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
begin

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  new(rkey0025);
  rkey0025^:=fieldvalues['rkey'];
  node:=treeview.Items.AddObject
  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
  node.ImageIndex:=0;  //为第一层节点定义图画
 end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  while not dm.ADOQuery1.Eof do
  begin
   new(rkey0025);
   rkey0025^:= dm.ADOQuery1.fieldvalues['rkey'];
   node:=treeview.Items.AddChildObject
      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
   node.ImageIndex := 1;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              dm.ADOQuery1.fieldbyname('rkey').AsString;
     open;
     while not dm.ADOQuery2.Eof do
     begin
      new(rkey0025);
      rkey0025^:= dm.ADOQuery2.fieldvalues['rkey'];
      node:=treeview.Items.AddChildObject
       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
      node.ImageIndex := 2;

       with dm.ADOQuery3 do
        begin
         close;
         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
                  dm.ADOQuery2.fieldbyname('rkey').AsString;
         open;
         while not dm.ADOQuery3.Eof do
         begin
          new(rkey0025);
          rkey0025^:= dm.ADOQuery3.fieldvalues['rkey'];
          node:=treeview.Items.AddChildObject
           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
          node.ImageIndex := 3;
          node:=node.Parent;
          dm.ADOQuery3.Next;
         end;
        end;

      node:=node.Parent;
      dm.ADOQuery2.Next;
     end;
    end;
   node:=node.Parent; //节点指向其父节点值
   dm.ADOQuery1.Next;
  end;
 end;

 treeview.FullExpand; //全部展开
 treeview.Items[0].Selected:=true;
end;

procedure TForm1.CopyStandar(Sender: TObject);
var i,j:word;
    QueryTmp1,QueryTmp2,QueryTmp3:TADOQuery;
   PROD_PTR,LAYERS,customer,parent,ttype,qty_hand,CREATED_ptr,warehouse_ptr,toprkey25,nopb_flag:integer;
   sRev,analysis_2,analysis_3,memo_text,green_flag,current_rev:string;
   CREATED_date:tdatetime;
   REPORT_UNIT_VALUE1,EST_SCRAP:Currency;
   REACH : Boolean;
begin
  QueryTmp1:=TADOQuery.Create(Self);
  QueryTmp1.Connection := DM.ADOConnection1;
  QueryTmp2:=TADOQuery.Create(Self);
  QueryTmp2.Connection := DM.ADOConnection1;
  QueryTmp3:=TADOQuery.Create(Self);
  QueryTmp3.Connection := DM.ADOConnection1;

  dm.ADOConnection1.BeginTrans;    //开始变更，复制数据
  screen.Cursor:=crappstart;
  toprkey25:=0;
    try

           toprkey25:= DM.ADS25rkey.Value;
          for i:=1 to treeview2.Items.Count-1 do
          begin
                 parent:=Pinteger(treeview2.Items[i].Data)^;
                 with QueryTmp1 do
                 begin
                      close;
                      sql.Text:='select * from data0025 where rkey='+inttostr(parent);
                      open;
                 end;
                    dm.AQY0025.Close;
                    dm.AQY0025.Parameters[0].Value:=DM.ADS25rkey.Value;
                    dm.AQY0025.Open;
                    customer:=dm.AQY0025CUSTOMER_PTR.Value;
                    //parent:=dm.AQY0025PARENT_PTR.Value;
                    warehouse_ptr:=dm.AQY0025PROD_ROUTE_PTR.Value; //工厂指针
                    PROD_PTR:=dm.AQY0025PROD_CODE_PTR.Value;       //产品类型
                    //LAYERS:=dm.AQY0025LAYERS.Value;                //层数
                    ttype:=dm.AQY0025ttype.Value;                  //产品属性
                    qty_hand:=dm.AQY0025QTY_ON_HAND.Value;         //库存
                    analysis_2:=dm.AQY0025ANALYSIS_CODE_2.Value;   //客户物料号
                    analysis_3:=dm.AQY0025ANALYSIS_CODE_3.Value;   //大料规格
                    memo_text:= dm.AQY0025memo_text.Value;         //市场备注
                    CREATED_ptr:=dm.AQY0025CREATED_BY_EMPL_PTR.Value;  //创建人员
                    CREATED_date:=dm.AQY0025CUSTPART_ENT_DATE.Value;   //创建日期
                    REPORT_UNIT_VALUE1:=dm.AQY0025REPORT_UNIT_VALUE1.Value; //产品重量
                    EST_SCRAP:=dm.AQY0025EST_SCRAP.Value;  //报废率
                    green_flag := dm.AQY0025green_flag.AsString ;
                    current_rev :=  dm.AQY0025current_rev.AsString;
                    nopb_flag :=   dm.AQY0025nopb_flag.Value;    //无铅要求
                    REACH :=   dm.AQY0025REACH.Value;              //REACH要求

                    dm.AQY0025.Close;
                    dm.AQY0025.Parameters[0].Value:=null;
                    dm.AQY0025.Open;
                    dm.AQY0025.append;
                  //  for j:=4 to 61 do
                  //  dm.AQY0025.Fields[j].Value:=QueryTmp1.FieldValues[dm.AQY0025.Fields[j].FieldName];
                     dm.AQY0025.Fields[5].Value:=QueryTmp1.FieldValues[dm.AQY0025.Fields[5].FieldName];
                     dm.AQY0025MANU_PART_NUMBER.Value:=treeview3.Items[i].Text;
                     dm.AQY0025PROD_ROUTE_PTR.Value:=warehouse_ptr;
                     dm.AQY0025PROD_CODE_PTR.Value:=PROD_PTR;       //产品类型
                    // dm.AQY0025LAYERS.Value:=LAYERS;
                     dm.AQY0025CREATED_BY_EMPL_PTR.Value:=CREATED_ptr;
                     dm.AQY0025CUSTPART_ENT_DATE.Value:=CREATED_date;
                     dm.AQY0025ANALYSIS_CODE_2.Value:=analysis_2;
                     dm.AQY0025ANALYSIS_CODE_3.Value:=analysis_3;
                     dm.AQY0025memo_text.Value:=memo_text;           //市场备注
                     dm.AQY0025REPORT_UNIT_VALUE1.Value := REPORT_UNIT_VALUE1; //单位重量
                     dm.AQY0025LAST_MODIFIED_DATE.Value:=getsystem_date(dm.adoquery1,1);
                     dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
                     dm.AQY0025TSTATUS.Value:=0;
                     dm.AQY0025CHECK_BY_PTR.AsVariant:=null;
                     dm.AQY0025CHECK_DATE.AsVariant:=null;
                     dm.AQY0025AUDITED_BY_PTR.AsVariant:=null;
                     dm.AQY0025AUDITED_DATE.AsVariant:=null;
                     dm.AQY0025ENG_ROUTE_PTR.AsVariant:=null;    //流程模型指针
                     dm.AQY0025ALLOW_EDIT_FLAG.Value:='Y';       //允许编辑
                     dm.AQY0025ONHOLD_SALES_FLAG.Value:=0;       //可以销售
                     dm.AQY0025ONHOLD_RELEASE_FLAG.Value:=1;     //工单发出暂缓
                     dm.AQY0025ONHOLD_PLANNING_FLAG.Value:=1;    //投产暂缓
                     dm.AQY0025CUSTOMER_PTR.Value:=customer;     //客户指针
                     dm.AQY0025EST_SCRAP.Value := EST_SCRAP;  //报废率
                     dm.AQY0025green_flag.AsString :=  green_flag;
                     dm.AQY0025current_rev.AsString :=  current_rev;
                     dm.AQY0025nopb_flag.Value:=   nopb_flag ;    //无铅要求
                     dm.AQY0025REACH.Value:=   REACH ;         //REACH要求

                   {  if parent>0 then
                      dm.AQY0025PARENT_PTR.Value:=parent
                     else
                      dm.AQY0025PARENT_PTR.AsVariant:=null;  }

                     dm.AQY0025ttype.Value:=ttype;
                     dm.AQY0025QTY_ON_HAND.Value:=qty_hand;

                      if i > 1 then
                          dm.AQY0025PARENT_PTR.Value:=self.getparent_ptr(treeview3.Items[i])
                         else  if i = 1 then
                         begin
                          dm.AQY0025PARENT_PTR.AsVariant:=DM.ADS25rkey.Value;
                          //dm.AQY0025PROD_CODE_PTR.Value:=rkey08;
                          dm.AQY0025ANCESTOR_PTR.Value:=0; //ecn升级新增
                         end   else
                         begin
                          dm.AQY0025PARENT_PTR.AsVariant:=null;
                          //dm.AQY0025PROD_CODE_PTR.Value:=rkey08;
                          dm.AQY0025ANCESTOR_PTR.Value:=0; //ecn升级新增
                         end;

                     dm.AQY0025.Post;

                     {    dm.AQY0025.Close;
                         dm.AQY0025.Parameters[0].Value:=null;
                         dm.AQY0025.Open;
                         dm.AQY0025.append;
                         for j:=4 to 61 do
                         dm.AQY0025.Fields[j].Value:=QueryTmp1.FieldValues[dm.AQY0025.Fields[j].FieldName];
                         dm.AQY0025CREATED_BY_EMPL_PTR.Value:= created_by;
                         dm.AQY0025CUSTPART_ENT_DATE.Value:= getsystem_date(QueryTmp2,1);
                         dm.AQY0025LAST_MODIFIED_DATE.Value:= getsystem_date(QueryTmp2,0);
                         dm.AQY0025LAST_MODIFIED_BY_PTR.Value:= strtoint(user_ptr);
                         dm.AQY0025TSTATUS.Value:=0;     //未提交

                         dm.AQY0025CHECK_BY_PTR.AsVariant:=null;
                         dm.AQY0025CHECK_DATE.AsVariant:=null;
                         dm.AQY0025AUDITED_BY_PTR.AsVariant:=null;
                         dm.AQY0025AUDITED_DATE.AsVariant:=null;
                         dm.AQY0025ALLOW_EDIT_FLAG.Value:='Y';       //允许编辑
                         dm.AQY0025ONHOLD_SALES_FLAG.Value:=0;       //可以销售
                         dm.AQY0025ONHOLD_RELEASE_FLAG.Value:=1;     //工单发出暂缓
                         dm.AQY0025ONHOLD_PLANNING_FLAG.Value:=1;    //投产暂缓
                         dm.AQY0025MANU_PART_NUMBER.Value:=treeview3.Items[i].Text;
                         dm.AQY0025MANU_PART_DESC.Value:=DM.ADS25MANU_PART_DESC.Value;

                         if i > 1 then
                          dm.AQY0025PARENT_PTR.Value:=self.getparent_ptr(treeview3.Items[i])
                         else  if i = 1 then
                         begin
                          dm.AQY0025PARENT_PTR.AsVariant:=DM.ADS25rkey.Value;
                          dm.AQY0025PROD_CODE_PTR.Value:=rkey08;
                          dm.AQY0025ANCESTOR_PTR.Value:=0; //ecn升级新增
                         end   else
                         begin
                          dm.AQY0025PARENT_PTR.AsVariant:=null;
                          dm.AQY0025PROD_CODE_PTR.Value:=rkey08;
                          dm.AQY0025ANCESTOR_PTR.Value:=0; //ecn升级新增
                         end;

                      {   if RadioGroup1.ItemIndex <> -1 then
                          dm.AQY0025ttype.Value:=RadioGroup1.ItemIndex    //量产
                         else
                          dm.AQY0025ttype.Value:=RadioGroup1.ItemIndex;   //样版
                         dm.AQY0025.Post;  //以上复制厂编基本信息25表      }

                         if i=0 then  toprkey25:=dm.AQY0025RKEY.Value;
                         Pinteger(treeview3.Items[0].Data)^:=DM.ADS25rkey.Value;
                         Pinteger(treeview3.Items[i].Data)^:=dm.AQY0025RKEY.Value;


                  {   with dm.ADOQuery1 do       //拼版结构
                     begin
                      close;
                      sql.Text:='select * from data0502 where source_ptr='+ inttostr(parent);
                      open;
                     end;
                     if not dm.ADOQuery1.IsEmpty then
                     begin
                      dm.ads502.Close;
                      dm.ads502.Parameters[0].Value:=null;
                      dm.ads502.Open;
                      dm.ads502.Append;
                      for j:=1 to 20 do
                       dm.ads502.Fields[j].Value:=dm.ADOQuery1.FieldValues[dm.ads502.Fields[j].FieldName];
                      dm.ads502source_ptr.Value:= dm.AQY0025RKEY.Value;
                      dm.ads502.Post;
                     end;                 }
                     //----//以下复制bom参数和工序流程
                     with QueryTmp2 do      //打开BOM制程参数
                     begin
                      close;
                      sql.Text:=
                       'SELECT Data0497.PARAMETER_PTR, Data0497.PARAMETER_VALUE,'+#13+
                       'Data0497.SOURCE_PTR, Data0497.ROUTE_STEP_PTR,Data0497.SEQ_NO'+#13+
                       'FROM dbo.Data0038 INNER JOIN'+#13+
                       'dbo.Data0497 ON dbo.Data0038.RKEY = dbo.Data0497.ROUTE_STEP_PTR'+#13+
                       'where data0038.source_ptr='+inttostr(parent)+#13+
                       'order by Data0497.ROUTE_STEP_PTR';
                      open;
                     end;

                     with QueryTmp1 do       //打开工艺流程
                     begin
                      close;
                      sql.Text:='SELECT rkey,SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER,'+#13+
                                'tooling_rev,OUTP_SPFC,tool_old_rev FROM Data0038'+#13+
                        'where source_ptr='+inttostr(parent)+#13+
                        'order by step_number';
                      open;
                      if not isempty then
                      begin
                       dm.ADS38_1.Close;
                       dm.ADS38_1.Parameters[0].Value:=null;
                       dm.ADS38_1.Open;
                       if not QueryTmp2.IsEmpty then dm.ads497.Open;

                       while not eof do
                       begin
                        dm.ADS38_1.Append;
                        for j:=2 to 7 do
                        begin
                         dm.ADS38_1.Fields[j].Value := FieldValues[dm.ADS38_1.Fields[j].FieldName];
                        end;
                            dm.ADS38_1SOURCE_PTR.Value := dm.AQY0025RKEY.Value;
                        dm.ADS38_1tool_old_rev.Value:=dm.ADS38_1tooling_rev.Value;
                        if trim(dm.ADS38_1tooling_rev.Value)<>'' then
                          dm.ADS38_1tooling_rev.Value:=sRev;
                        dm.ADS38_1.post;

                        QueryTmp2.Filter:='ROUTE_STEP_PTR='+fieldbyname('rkey').AsString;
                        while not QueryTmp2.Eof do
                        begin
                         dm.ads497.Append;
                         for j:=0 to 4 do
                          dm.ads497.Fields[j].Value :=dm.ADOQuery2.FieldValues[dm.ads497.Fields[j].FieldName];
                         dm.ads497ROUTE_STEP_PTR.Value:=dm.ads38_1rkey.value;
                         dm.ads497.Post;
                         QueryTmp2.Next;
                        end;
                        next;
                       end;
                       QueryTmp2.Filter:='';
                      end;
                     end;    //----//以上复制bom参数和工序流程

                     with QueryTmp1 do //制程参数
                     begin
                      close;
                      sql.Text:='SELECT Data0494.PARAMETER_PTR, Data0494.PARAMETER_VALUE,'+#13+
                       'Data0494.custpart_ptr,Data0494.step_number,Data0494.seq_no,Data0494.Doc_Flag,'+#13+
                       'Data0494.after_flag, Data0494.flow_spfc_flag,data0278.status4'+#13+
                       'FROM Data0494 inner join data0278'+#13+
                       'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
                       'where Data0494.custpart_ptr = '+inttostr(parent)+#13+
                       'order by Data0494.step_number,Data0494.seq_no';
                      open;
                      if not isempty then
                      begin
                       dm.ads494_1.Close;
                       dm.ads494_1.Parameters[0].Value:=null;
                       dm.ads494_1.Open;
                       while not eof do
                       begin
                        dm.ads494_1.Append;
                         for j:=0 to 7 do
                         dm.ads494_1.Fields[j].Value:=FieldValues[dm.ads494_1.Fields[j].FieldName];
                         dm.ads494_1custpart_ptr.Value:= dm.AQY0025RKEY.Value;
                         if fieldbyname('status4').AsInteger=1 then
                         dm.ads494_1PARAMETER_VALUE.Value:='';
                         dm.ads494_1.post;
                         next;
                       end;
                      end;
                     end;

                     with QueryTmp1 do         //全局参数加流程判断参数
                     begin
                      close;
                      sql.Text:='select data0279.PARAMETER_PTR, data0279.PARAMETER_VALUE ,'+#13+
                       'data0279.IES_PROD,data0279.IES_CRP,data0278.status4'+#13+
                       'from data0279 inner join data0278'+#13+
                       'on data0279.PARAMETER_PTR=data0278.rkey'+#13+
                       'where data0279.source_ptr='+inttostr(parent)+#13+
                       'order by data0279.IES_CRP';
                      open;
                      if not isempty then
                      begin
                       dm.ads279_1.close;
                       dm.ads279_1.Parameters[0].Value:=null;
                       dm.ads279_1.Open;
                       while not eof do
                       begin
                        dm.ads279_1.Append;
                        for j:=1 to 4 do
                         dm.ads279_1.Fields[j].Value:=FieldValues[dm.ads279_1.Fields[j].FieldName];
                         dm.ads279_1source_PTR.Value:= dm.AQY0025RKEY.Value;
                        if fieldbyname('status4').AsInteger=1 then
                         dm.ads279_1PARAMETER_VALUE.Value:='';
                        dm.ads279_1.post;
                        next;
                       end;
                      end;
                     end;

                     with QueryTmp1 do   //29 钻咀表
                     begin
                      close;
                      sql.Text:=
                       'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
                       'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
                       'FROM dbo.Data0029'+#13+
                       'where source_ptr='+inttostr(parent);
                      open;
                      if not isempty then
                      begin
                       with QueryTmp2 do
                       begin
                        close;
                        sql.Text:=
                        'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
                        'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
                        'FROM dbo.Data0029'+#13+
                        'where source_ptr is null';
                        open;
                       end;

                       while not eof do
                       begin
                        QueryTmp2.Append;
                         for j:=1 to 12 do
                         QueryTmp2.Fields[j].Value:=FieldValues[QueryTmp2.Fields[j].FieldName];
                        QueryTmp2.FieldValues['SOURCE_PTR']:= dm.AQY0025RKEY.Value;
                        QueryTmp2.Post;
                        next;
                       end;
                      end;
                     end;
          end;       //结束循环新增

                      //以下复制主流程

                         parent:=rkey25;
                         with QueryTmp1 do
                         begin
                              close;
                              sql.Text:='select * from data0025 where rkey='+inttostr(parent);
                              open;
                         end;

                     dm.AQY0025.Close;
                     dm.AQY0025.Parameters[0].Value:=DM.ADS25rkey.Value;
                     dm.AQY0025.Open;
                     dm.AQY0025.Edit;
                     dm.AQY0025LAST_MODIFIED_DATE.Value:=getsystem_date(dm.adoquery1,1);
                     dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
                {     for j:=4 to 61 do
                     dm.AQY0025.Fields[j].Value:=QueryTmp1.FieldValues[dm.AQY0025.Fields[j].FieldName];

                     dm.AQY0025PROD_ROUTE_PTR.Value:=warehouse_ptr;
                     dm.AQY0025PROD_CODE_PTR.Value:=PROD_PTR;       //产品类型
                     //dm.AQY0025LAYERS.Value:=LAYERS;
                     dm.AQY0025CREATED_BY_EMPL_PTR.Value:=CREATED_ptr;
                     dm.AQY0025CUSTPART_ENT_DATE.Value:=CREATED_date;
                     dm.AQY0025ANALYSIS_CODE_2.Value:=analysis_2;
                     dm.AQY0025ANALYSIS_CODE_3.Value:=analysis_3;
                     dm.AQY0025memo_text.Value:=memo_text;           //市场备注
                     dm.AQY0025REPORT_UNIT_VALUE1.Value := REPORT_UNIT_VALUE1; //单位重量
                     dm.AQY0025LAST_MODIFIED_DATE.Value:=getsystem_date(dm.adoquery1,1);
                     dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
                     dm.AQY0025TSTATUS.Value:=0;
                     dm.AQY0025CHECK_BY_PTR.AsVariant:=null;
                     dm.AQY0025CHECK_DATE.AsVariant:=null;
                     dm.AQY0025AUDITED_BY_PTR.AsVariant:=null;
                     dm.AQY0025AUDITED_DATE.AsVariant:=null;
                     dm.AQY0025ENG_ROUTE_PTR.AsVariant:=null;    //流程模型指针
                     dm.AQY0025ALLOW_EDIT_FLAG.Value:='Y';       //允许编辑
                    // dm.AQY0025ONHOLD_SALES_FLAG.Value:=0;       //可以销售
                     dm.AQY0025ONHOLD_RELEASE_FLAG.Value:=1;     //工单发出暂缓
                     dm.AQY0025ONHOLD_PLANNING_FLAG.Value:=1;    //投产暂缓
                     dm.AQY0025CUSTOMER_PTR.Value:=customer;     //客户指针
                     dm.AQY0025EST_SCRAP.Value := EST_SCRAP;  //报废率
                    { if parent>0 then
                      dm.AQY0025PARENT_PTR.Value:=parent
                     else
                      dm.AQY0025PARENT_PTR.AsVariant:=null;
                     dm.AQY0025ttype.Value:=ttype;
                     dm.AQY0025QTY_ON_HAND.Value:=qty_hand; }
                     dm.AQY0025.Post;


                        { dm.AQY0025.Close;
                         dm.AQY0025.Parameters[0].Value:=DM.ADS25rkey.Value;
                         dm.AQY0025.Open;
                         dm.AQY0025.Edit;
                         for j:=4 to 61 do
                         dm.AQY0025.Fields[j].Value:=QueryTmp1.FieldValues[dm.AQY0025.Fields[j].FieldName];
                         dm.AQY0025CREATED_BY_EMPL_PTR.Value:= created_by;
                         dm.AQY0025CUSTPART_ENT_DATE.Value:= getsystem_date(QueryTmp2,1);
                         dm.AQY0025LAST_MODIFIED_DATE.Value:= getsystem_date(QueryTmp2,0);
                         dm.AQY0025LAST_MODIFIED_BY_PTR.Value:= strtoint(user_ptr);
                         dm.AQY0025TSTATUS.Value:=0;
                         dm.AQY0025.Post;  //以上复制厂编基本信息25表  }
                         toprkey25:=dm.AQY0025RKEY.Value;
                         Pinteger(treeview3.Items[0].Data)^:=dm.AQY0025RKEY.Value;

                  {   with dm.ADOQuery1 do       //拼版结构
                     begin
                      close;
                      sql.Text:='select * from data0502 where source_ptr='+ inttostr(parent);
                      open;
                     end;
                     if not dm.ADOQuery1.IsEmpty then
                     begin
                      dm.ads502.Close;
                      dm.ads502.Parameters[0].Value:=null;
                      dm.ads502.Open;
                      dm.ads502.Append;
                      for j:=1 to 20 do
                       dm.ads502.Fields[j].Value:=dm.ADOQuery1.FieldValues[dm.ads502.Fields[j].FieldName];
                      dm.ads502source_ptr.Value:= dm.AQY0025RKEY.Value;
                      dm.ads502.Post;
                     end;                 }
                     //----//以下复制bom参数和工序流程
                     with QueryTmp2 do      //打开BOM制程参数
                     begin
                      close;
                      sql.Text:=
                       'SELECT Data0497.PARAMETER_PTR, Data0497.PARAMETER_VALUE,'+#13+
                       'Data0497.SOURCE_PTR, Data0497.ROUTE_STEP_PTR,Data0497.SEQ_NO'+#13+
                       'FROM dbo.Data0038 INNER JOIN'+#13+
                       'dbo.Data0497 ON dbo.Data0038.RKEY = dbo.Data0497.ROUTE_STEP_PTR'+#13+
                       'where data0038.source_ptr='+inttostr(parent)+#13+
                       'order by Data0497.ROUTE_STEP_PTR';
                      open;
                     end;

                     with QueryTmp1 do       //打开工艺流程
                     begin
                      close;
                      sql.Text:='SELECT rkey,SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER,'+#13+
                                'tooling_rev,OUTP_SPFC,tool_old_rev FROM Data0038'+#13+
                        'where source_ptr='+inttostr(parent)+#13+
                        'order by step_number';
                      open;
                      if not isempty then
                      begin

                          dm.ADS38_1.Close;
                          dm.ADS38_1.Parameters[0].Value:=DM.ADS25rkey.Value;
                          dm.ADS38_1.Open;
                          while not dm.ADS38_1.Eof do dm.ADS38_1.Delete;

                       dm.ADS38_1.Close;
                       dm.ADS38_1.Parameters[0].Value:=null;
                       dm.ADS38_1.Open;
                       if not QueryTmp2.IsEmpty then dm.ads497.Open;

                       while not eof do
                       begin
                        dm.ADS38_1.Append;
                        for j:=2 to 7 do
                        begin
                            dm.ADS38_1.Fields[j].Value := FieldValues[dm.ADS38_1.Fields[j].FieldName];
                        end;

                        dm.ADS38_1SOURCE_PTR.Value := DM.ADS25rkey.Value;
                        dm.ADS38_1tool_old_rev.Value:=dm.ADS38_1tooling_rev.Value;
                        if trim(dm.ADS38_1tooling_rev.Value)<>'' then
                          dm.ADS38_1tooling_rev.Value:=sRev;
                        dm.ADS38_1.post;

                        QueryTmp2.Filter:='ROUTE_STEP_PTR='+fieldbyname('rkey').AsString;
                        while not QueryTmp2.Eof do
                        begin
                         dm.ads497.Append;
                         for j:=0 to 4 do
                          dm.ads497.Fields[j].Value :=dm.ADOQuery2.FieldValues[dm.ads497.Fields[j].FieldName];
                         dm.ads497ROUTE_STEP_PTR.Value:=dm.ads38_1rkey.value;
                         dm.ads497.Post;
                         QueryTmp2.Next;
                        end;
                        next;
                       end;
                       QueryTmp2.Filter:='';
                      end;
                     end;    //----//以上复制bom参数和工序流程

                   {  if (radiobutton4.Checked) and (find_ecn_qa()) then
                     with QueryTmp1 do  //样板转批量将样品品质跟踪表复制到工序制程参数
                      begin
                        Close;
                        SQL.Text := 'update data0038'+#13+
                         'set DEF_ROUT_INST=isnull(DEF_ROUT_INST,'''')+isnull(DATA0031.technology_diff,'''')'+#13+
                         'FROM         dbo.DATA0031 INNER JOIN  '+#13+
                         'dbo.Data0038 ON dbo.DATA0031.STEP_NUMBER = dbo.Data0038.STEP_NUMBER'+#13+
                         'AND dbo.DATA0031.DEPT_PTR = dbo.Data0038.DEPT_PTR'+#13+
                         'WHERE     (dbo.DATA0031.SOURCE_PTR = '+inttostr(parent)+') AND'+#13+
                         '(dbo.Data0038.SOURCE_PTR = '+dm.AQY0025RKEY.AsString+')';
                        ExecSQL;
                      end;  }

                     with QueryTmp1 do //制程参数
                     begin
                      close;
                      sql.Text:='SELECT Data0494.PARAMETER_PTR, Data0494.PARAMETER_VALUE,'+#13+
                       'Data0494.custpart_ptr,Data0494.step_number,Data0494.seq_no,Data0494.Doc_Flag,'+#13+
                       'Data0494.after_flag, Data0494.flow_spfc_flag,data0278.status4'+#13+
                       'FROM Data0494 inner join data0278'+#13+
                       'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
                       'where Data0494.custpart_ptr = '+inttostr(parent)+#13+
                       'order by Data0494.step_number,Data0494.seq_no';
                      open;
                      if not isempty then
                      begin
                        dm.ads494_1.Close;                      //制程参数
                        dm.ads494_1.Parameters[0].Value:=DM.ADS25rkey.Value;
                        DM.ads494_1.Open;
                        dm.ads494_1.Filter:='';
                        while not dm.ads494_1.Eof do dm.ads494_1.Delete;

                       dm.ads494_1.Close;
                       dm.ads494_1.Parameters[0].Value:=null;
                       dm.ads494_1.Open;
                       while not eof do
                       begin
                        dm.ads494_1.Append;
                        for j:=0 to 7 do
                         dm.ads494_1.Fields[j].Value:=FieldValues[dm.ads494_1.Fields[j].FieldName];
                        dm.ads494_1custpart_ptr.Value:= DM.ADS25rkey.Value;
                        if fieldbyname('status4').AsInteger=1 then
                         dm.ads494_1PARAMETER_VALUE.Value:='';
                        dm.ads494_1.post;
                        next;
                       end;
                      end;
                     end;

                     with QueryTmp1 do         //全局参数加流程判断参数
                     begin
                      close;
                      sql.Text:='select data0279.PARAMETER_PTR, data0279.PARAMETER_VALUE ,'+#13+
                       'data0279.IES_PROD,data0279.IES_CRP,data0278.status4'+#13+
                       'from data0279 inner join data0278'+#13+
                       'on data0279.PARAMETER_PTR=data0278.rkey'+#13+
                       'where data0279.source_ptr='+inttostr(parent)+#13+
                       'order by data0279.IES_CRP';
                      open;
                      if not isempty then
                      begin
                        dm.ads279_1.close;
                        dm.ads279_1.Parameters[0].Value:=DM.ADS25rkey.Value;
                        dm.ads279_1.Open;
                         while not dm.ads279_1.Eof do dm.ads279_1.Delete;

                       dm.ads279_1.close;
                       dm.ads279_1.Parameters[0].Value:=null;
                       dm.ads279_1.Open;
                       while not eof do
                       begin
                        dm.ads279_1.Append;
                        for j:=1 to 4 do
                         dm.ads279_1.Fields[j].Value:=FieldValues[dm.ads279_1.Fields[j].FieldName];
                        dm.ads279_1source_PTR.Value:= DM.ADS25rkey.Value;
                        if fieldbyname('status4').AsInteger=1 then
                         dm.ads279_1PARAMETER_VALUE.Value:='';
                        dm.ads279_1.post;
                        next;
                       end;
                      end;
                     end;

                     with QueryTmp1 do      //89评审参数
                     begin
                      close;
                      sql.Text:='SELECT cust_part_ptr,parameter_ptr,tvalue'+#13+
                       'FROM dbo.Data0089'+#13+
                       'where cust_part_ptr='+inttostr(parent);
                      open;
                      if not isempty then
                      begin
                       with QueryTmp2 do
                       begin
                        close;
                        sql.Text:='SELECT cust_part_ptr,parameter_ptr,tvalue'+#13+
                         'FROM dbo.Data0089'+#13+
                         'where cust_part_ptr is null';
                        open;
                       end;
                       while not eof do
                       begin
                        QueryTmp2.Append;
                        for j:=1 to 2 do
                         QueryTmp2.Fields[j].Value:=FieldValues[QueryTmp2.Fields[j].FieldName];
                        QueryTmp2.FieldValues['cust_part_ptr']:= DM.ADS25rkey.AsString;
                        QueryTmp2.Post;
                        next;
                       end;
                      end;
                     end;

                     with QueryTmp1 do   //29 钻咀表
                     begin
                      close;
                      sql.Text:=
                       'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
                       'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
                       'FROM dbo.Data0029'+#13+
                       'where source_ptr='+inttostr(parent);
                      open;
                      if not isempty then
                      begin
                          QueryTmp3.close;
                          QueryTmp3.sql.Text:=
                          'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
                          'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
                          'FROM dbo.Data0029'+#13+
                          'where source_ptr ='+DM.ADS25rkey.AsString;
                          QueryTmp3.open;
                          while not QueryTmp3.eof do
                          QueryTmp3.delete;

                       with QueryTmp2 do
                       begin
                        close;
                        sql.Text:=
                        'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
                        'UNIT, PANEL_A, PANEL_B, REMARK,SEQ_NO,SET_UNMBER'+#13+
                        'FROM dbo.Data0029'+#13+
                        'where source_ptr is null';
                        open;
                       end;

                       while not eof do
                       begin
                        QueryTmp2.Append;
                         for j:=1 to 12 do
                         QueryTmp2.Fields[j].Value:=FieldValues[QueryTmp2.Fields[j].FieldName];
                        QueryTmp2.FieldValues['SOURCE_PTR']:= DM.ADS25rkey.Value;
                        QueryTmp2.Post;
                        next;
                       end;
                      end;
                     end;

                     if i=0 then
                      with QueryTmp1 do   //复制35 ecn履历表
                      begin
                       close;
                       sql.Text:=
                        'SELECT part_ptr,serial_no,part_number,text,source,if_gerber,create_employee,'+#13+
                        'engineer,ecn_no,enter_date '+#13+
                        'FROM Data0035'+#13+
                        'where part_ptr='+inttostr(parent);
                       open;
                       if not isempty then
                       begin
                          QueryTmp3.close;
                          QueryTmp3.sql.Text:=
                          'SELECT part_ptr,serial_no,part_number,text,source,if_gerber,create_employee,'+#13+
                        'engineer,ecn_no,enter_date '+#13+
                        'FROM Data0035'+#13+
                        'where part_ptr='+DM.ADS25rkey.AsString;
                          QueryTmp3.open;
                          while not QueryTmp3.eof do
                          QueryTmp3.delete;

                        with QueryTmp2 do
                        begin
                         close;
                         sql.Text:=
                          'SELECT part_ptr,serial_no,part_number,text,source,if_gerber,create_employee,'+#13+
                          'engineer,ecn_no,enter_date '+#13+
                          'FROM Data0035'+#13+
                          'where part_ptr is null';
                         open;
                        end;

                        while not eof do
                        begin
                         QueryTmp2.Append;
                         for j:=1 to 9 do
                          QueryTmp2.Fields[j].Value:=FieldValues[QueryTmp2.Fields[j].FieldName];
                         QueryTmp2.FieldValues['part_ptr']:= DM.ADS25rkey.Value;
                         QueryTmp2.Post;
                         next;
                        end;
                       end;
                      end;     


     { dm.adsa273.Close;
      dm.adsa273.Parameters[0].Value:=null;
      dm.adsa273.Open;
      dm.adsa273.Append;
      dm.adsa273CUSTOMER_PTR.Value:=rkey10;
      dm.adsa273COPYFROMCUST_PTR.Value:=rkey25;
      dm.adsa273CUSTOMER_PART_PTR.Value:=toprkey25;
      dm.adsa273ENTERED_BY.Value:= strtoint(user_ptr);
      dm.adsa273ENTERED_DATE.Value:=getsystem_date(QueryTmp2,1);
      dm.adsa273last_modi_by_ptr.Value:= dm.adsa273ENTERED_BY.Value;
      dm.adsa273last_modi_date.Value:=getsystem_date(QueryTmp2,0);
      if radiobutton1.Checked then
       dm.adsa273Tooling_close.Value:=1
      else if radiobutton2.Checked then
       dm.adsa273Tooling_close.Value:=2
      else if radiobutton3.Checked then
       dm.adsa273Tooling_close.Value:=3
      else dm.adsa273Tooling_close.Value:=4;
      dm.adsa273text.Value:=memo1.Text;
      dm.adsa273ECNSTART.Value:=radiogroup2.ItemIndex;
      dm.adsa273ECN_NO.Value:=edit1.Text;
      dm.adsa273STATUS.Value:=0;
      dm.adsa273SOURCE.Value:=radiogroup1.ItemIndex+1;
      dm.adsa273del.Value:=sales_flag;
      dm.adsa273.Post;

      dm.ADs04.Close;
      dm.ADs04.Open;
      if dm.ADs04SEED_FLAG.Value<>1 then
       self.update_04(trim(edit1.Text));
       update_08
      //if checkbox1.Checked then update_08;     //是否更新初始值

      if dm.adsa273del.Value=0 then           //是否将旧版本暂缓
       UPDATEDATA0025(radiogroup2.ItemIndex,dm.adsa273COPYFROMCUST_PTR.Value);  }
      //UPDATEDATA0025(dm.AQY0025rkey.value);
      {if dm.adsa273Tooling_close.Value=4 then
       self.append_log119(dm.adsa273CUSTOMER_PART_PTR.Value);   }


      dm.ADOConnection1.CommitTrans;

      dm.AQY0025.Close;
      dm.ADS38_1.Close;
      dm.ads494_1.Close;
      dm.ads497_1.Close;
      dm.ads279_1.Close;
      dm.ADS38.Close;
      dm.ads494.Close;
      dm.ads497.Close;
      dm.ads279.Close;
      QueryTmp1.Free;
      QueryTmp2.Free;
      QueryTmp3.Free;

        messagedlg('数据复制成功!',mtinformation,[mbok],0);
        screen.Cursor:=crdefault;
    except
        on E: Exception do
        begin
             dm.ADOConnection1.RollbackTrans;
             screen.Cursor:=crdefault;
             messagedlg(E.Message,mterror,[mbcancel],0);
        end;
    end; //end try
end;

procedure TForm1.UPDATEDATA0025(RKEY:integer);
var
      QueryTmp1:TADOQuery;
BEGIN
      QueryTmp1:=TADOQuery.Create(Self);
      QueryTmp1.Connection := DM.ADOConnection1;
      with QueryTmp1 do     //更新顶层
       begin
        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+
                 'FROM dbo.Data0025'+#13+
        'where Data0025.RKEY='+inttostr(rkey);
        ExecSQL;

                //更新第二层

        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+
                 'FROM Data0025 INNER JOIN'+#13+
        'Data0025 Data0025_1 ON Data0025.PARENT_PTR = Data0025_1.RKEY'+#13+
        'where Data0025_1.RKEY='+inttostr(rkey);
        ExecSQL;


           //更新第三层

        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+  //暂缓下单
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+   //暂缓发放工单
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+  //暂缓投产
          'FROM data0025 INNER JOIN  '+#13+
          'Data0025 Data0025_1 ON'+#13+
          'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
          'Data0025 Data0025_2 ON '+#13+
          'Data0025_1.PARENT_PTR = Data0025_2.RKEY'+#13+
         'where Data0025_2.RKEY = '+inttostr(rkey);
        ExecSQL;


           //更新第四层

        close;
        SQL.Clear;
        sql.Text:='update data0025'+#13+
                 'set DATA0025.ONHOLD_SALES_FLAG=1,'+#13+  //暂缓下单
                 'DATA0025.ONHOLD_RELEASE_FLAG=1,'+#13+   //暂缓发放工单
                 'data0025.ONHOLD_PLANNING_FLAG=1'+#13+  //暂缓投产
          'FROM data0025 INNER JOIN  '+#13+
          'Data0025 Data0025_1 ON'+#13+
          'Data0025.PARENT_PTR = Data0025_1.RKEY INNER JOIN'+#13+
          'Data0025 Data0025_2 ON '+#13+
          'Data0025_1.PARENT_PTR = Data0025_2.RKEY INNER JOIN'+#13+
          'Data0025 Data0025_3 ON '+#13+
          'Data0025_2.PARENT_PTR = Data0025_3.RKEY'+#13+
         'where Data0025_3.RKEY = '+inttostr(rkey);
        ExecSQL;
      end;
    QueryTmp1.Free;

end;

procedure TForm1.M1Click(Sender: TObject);
var
  rkey,i,i73:integer;
    QueryTmp1, QueryTmp2 ,QueryTmp3:TADOQuery;
begin
      if messagedlg('此复制功能为先删除本厂编号所有内部资料，然后复制模板的相应参数，数据丢失风险大，您确定要使用该功能吗?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
      begin
               //  try
                TreeView2.Items.Clear;
                TreeView3.Items.Clear;
                QueryTmp1:=TADOQuery.Create(Self);
                QueryTmp1.Connection := DM.ADOConnection1;
                QueryTmp2:=TADOQuery.Create(Self);
                QueryTmp2.Connection := DM.ADOConnection1;
                QueryTmp3:=TADOQuery.Create(Self);
                QueryTmp3.Connection := DM.ADOConnection1;
               form_product:=tform_product.Create(application);
               form_product.edit1text := '';
               form_product.adoquery1.Close;
               Form_product.CheckBox1.Checked := True;
               //form_product.adoquery1.Parameters[0].Value:=edit1.Text+'%';
               //form_product.edit1text := edit1.Text+'%';
             form_product.adoquery1.Open;
              if form_product.adoquery1.IsEmpty then
                  BEGIN
                      messagedlg('没有找到需要复制的产品',mtinformation,[mbcancel],0);
                      EDIT1.SetFocus;
                  END
              else
             if form_product.ShowModal=mrok then
             begin
                        QueryTmp1.close;
                        QueryTmp1.sql.Clear;
                       // ShowMessage(dm.ADS25.fieldbyname('rkey').asstring);
                        QueryTmp1.sql.Text:= ' declare @Del table(ID int,[ParentId] int)  '+#13+
                                   ' insert @Del select rkey, parent_ptr from data0025 a where  '+#13+
                                   ' exists(select 1 from data0025 where a.rkey = '+dm.ADS25.fieldbyname('rkey').asstring+#13+
                                   ' ) while @@rowcount>0     '+#13+
                                   ' begin    '+#13+
                                   '     insert @Del   '+#13+
                                   '     select a.rkey, a.parent_ptr from data0025 a  '+#13+
                                   '     inner join @Del b on b.ID=a.parent_ptr  '+#13+
                                   '     where not exists(select 1 from @Del where ID=a.rkey) '+#13+
                                   ' end  '+#13+
                                   '   select * from @Del where ParentId is not null order by ID desc '+#13+#13;
                          QueryTmp1.Open;
                          if not QueryTmp1.IsEmpty then
                          begin
                              QueryTmp1.First;
                              while not QueryTmp1.Eof do
                              begin
                                                //29 钻咀表
                                       QueryTmp3.close;
                                        QueryTmp3.sql.Text:=
                                        'SELECT * '+#13+
                                        'FROM dbo.Data0029'+#13+
                                        'where source_ptr ='+QueryTmp1.fieldbyname('ID').asstring;
                                        QueryTmp3.open;
                                        while not QueryTmp3.eof do
                                        QueryTmp3.delete;

                                        QueryTmp3.close;
                                        QueryTmp3.sql.Text:=
                                        'SELECT * FROM dbo.Data0029'+#13+
                                        'where source_ptr ='+DM.ADS25rkey.AsString;
                                        QueryTmp3.open;
                                        while not QueryTmp3.eof do
                                        QueryTmp3.delete;

                                       dm.ADS38.Close;
                                       dm.ADS38.Parameters[0].Value:=QueryTmp1.fieldbyname('ID').asstring;
                                       dm.ADS38.Open;
                                       while not dm.ADS38.Eof do dm.ADS38.Delete;

                                       dm.ADS38.Close;
                                       dm.ADS38.Parameters[0].Value:=DM.ADS25rkey.AsString;
                                       dm.ADS38.Open;
                                       while not dm.ADS38.Eof do dm.ADS38.Delete;

                                       dm.ads279.close;
                                       dm.ads279.Parameters[0].Value:=QueryTmp1.fieldbyname('ID').asstring;
                                       dm.ads279.Open;
                                       while not dm.ads279.Eof do dm.ads279.Delete;

                                       dm.ads279.close;
                                       dm.ads279.Parameters[0].Value:=DM.ADS25rkey.AsString;
                                       dm.ads279.Open;
                                       while not dm.ads279.Eof do dm.ads279.Delete;

                                       dm.ads494.Close;                      //制程参数
                                       dm.ads494.Parameters[0].Value:=QueryTmp1.fieldbyname('ID').asstring;
                                       DM.ads494.Open;
                                       dm.ads494.Filter:='';
                                       while not dm.ads494.Eof do dm.ads494.Delete;

                                       dm.ads494.Close;                      //制程参数
                                       dm.ads494.Parameters[0].Value:=DM.ADS25rkey.AsString;
                                       DM.ads494.Open;
                                       dm.ads494.Filter:='';
                                       while not dm.ads494.Eof do dm.ads494.Delete;

                                       QueryTmp2.close;
                                       QueryTmp2.sql.Clear;
                                       QueryTmp2.sql.Text:=
                                        'SELECT *'+#13+
                                        'FROM dbo.Data0025'+#13+
                                        'where rkey ='+QueryTmp1.fieldbyname('ID').asstring;
                                        QueryTmp2.open;
                                        while not QueryTmp2.eof do
                                        QueryTmp2.delete;

                                    QueryTmp1.Next;
                              end;
                          end;

                     Self.get_treedate(Form_product.adoquery1.fieldbyname('rkey').AsInteger,treeview2);
                    rkey08 := form_product.adoquery1PROD_CODE_PTR.AsInteger;
                    rkey10:=form_product.adoquery1CUSTOMER_PTR.AsInteger;
                    rkey25:=Form_product.adoquery1.fieldbyname('rkey').AsInteger;
                    rkey15:=form_product.adoquery1PROD_ROUTE_PTR.AsInteger;
                    sales_flag:=form_product.adoquery1ONHOLD_SALES_FLAG.AsInteger;
                    treeview3.Items.Assign(treeview2.Items);
                    treeview3.FullExpand;
                    if treeview3.Items.Count>0 then
                      treeview3.Items[0].Text:=DM.ADS25MANU_PART_NUMBER.AsString;
                      for i:=0 to treeview3.Items.Count-1 do
                       if i=0 then
                          treeview3.Items[i].Text:= DM.ADS25MANU_PART_NUMBER.AsString
                       else
                          treeview3.Items[i].Text:= DM.ADS25MANU_PART_NUMBER.AsString+'.'+
                          copy(treeview3.Items[i].Text,
                           pos('.',treeview3.Items[i].Text)+1,
                           length(treeview3.Items[i].Text)-
                           pos('.',treeview3.Items[i].Text));
                     CopyStandar(Sender);
                     BitBtn3Click(nil);
                 { edit1.Text:=form_product.adoquery1MANU_PART_NUMBER.Value;
                  label4.Caption:=form_product.adoquery1MANU_PART_DESC.Value;
                  treeview2.Items.Clear;
                  get_treedate(form_product.adoquery1rkey.Value,treeview2,'');
                  self.target_rkey25.Caption:='0';
                  link_database:='';
                  if bitbtn1.Enabled then bitbtn1.Enabled:=false; }
             end
             else
              edit1.SetFocus;
         { finally
                form_product.Free;

          end; }
        QueryTmp1.Free;
        QueryTmp2.Free;
        QueryTmp3.Free;
      end;



end;
procedure TForm1.N11Click(Sender: TObject);
var
  rkey : Integer;
  table_name:string;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if set_lock(dm.ADS25rkey.Value,1) then  //锁定成功
  begin
    dm.AQY0025.Close;
    dm.AQY0025.Parameters[0].Value := dm.ADS25rkey.Value;
    dm.AQY0025.Open;
    table_name:='##d25_'+dm.ADS25rkey.AsString;
    if dm.AQY0025TSTATUS.Value=dm.ads25TSTATUS.Value then
      try
        Frm_EditGlobalParameter := TFrm_EditGlobalParameter.Create(Self);
        Frm_EditGlobalParameter.ADS278.Close;
        Frm_EditGlobalParameter.ADS278.Parameters.ParamByName('p1').Value := DM.ADS25MANU_PART_NUMBER.AsString+'%';
        Frm_EditGlobalParameter.ADS278.Open;
        Frm_EditGlobalParameter.DBComboBox1.Visible := False;
        if Frm_EditGlobalParameter.ShowModal=mrok then
        begin
          rkey := dm.ADS25rkey.Value;
          dm.ADS25.Close;
          dm.ADS25.Prepared;
          dm.ADS25.Open;
          if rkey > 0 then dm.ADS25.Locate('rkey',rkey,[]);
        end;
        with dm.aqtmp do   //无论保存或退出都删除锁定的记录
        begin
          Close;
          SQL.Text:='if exists(SELECT * FROM tempdb.dbo.sysobjects WHERE NAME='+quotedstr(table_name)+')'+#13+
            ' drop table '+table_name;
          execsql;
        end;

      finally
        Frm_EditGlobalParameter.free;
      end
    else
      messagedlg('状态发生变更不能编辑',mtinformation,[mbcancel],0);
  end;
end;

end.




