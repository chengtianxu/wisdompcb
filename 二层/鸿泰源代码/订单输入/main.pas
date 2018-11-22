unit main;

interface                                       

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Grids, DBGrids, ComCtrls, Mask,
  DBCtrls, DB, ADODB, ToolWin, ExtCtrls, Excel2000,  ComObj;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    enter_empl_ptr: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    CheckBox6: TCheckBox;
    N3: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    Label1: TLabel;
    Edit2: TEdit;
    N13: TMenuItem;
    N14: TMenuItem;
    BitBtn3: TBitBtn;
    N15: TMenuItem;
    Edit3: TEdit;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BtFlds: TBitBtn;
    PMFlds: TPopupMenu;
    BitBtn5: TBitBtn;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    BitBtn6: TBitBtn;
    N21: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    StringGrid1: TStringGrid;
    OpenDialog1: TOpenDialog;
    procedure checkvar();
    procedure aq97update();
    procedure pact_auth();
    procedure note_information(title,value: string; v_type: word);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N16Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtFldsClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure PMFldsPopup(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
    field_name,sql_text,total_sqltext:string;
    OldGridWnd : TWndMethod;
    procedure item_click(sender: TObject);
    procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
    cust_set:string;
    v_con:byte;
    procedure get_quotetools(rkey85:integer;sgrid:Tstringgrid);
    procedure ExcelToDB;
  end;

var
  Form1: TForm1;
  
const
  TmpFileDir = 'c:\tmp\';

implementation
 uses damo, addsa_order, edit_so, note, stop_po, active_po, cust_search,
  deptauth_info, so_report, note_information, Mreport, much_report, term,
  COMMON, ViewCredit, SCPO_reports, PubFunc, ShellAPI;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
  begin
   ShowMessage('程序启动失败，请联系系统管理员！');
   application.Terminate;
  end;
 self.Caption:=application.Title;

// rkey73:= '2636';
//  user_ptr := '3116';
//  vprev := '4';
//  dm.ADOConnection1.Open;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.get_quotetools(rkey85: integer;sgrid:Tstringgrid);
var
 i:integer;
begin
with dm.ADOQuery2 do
begin
 close;
 sql.Text:='select ADDL_CAT_PTR, AMOUNT, FREE_AMOUNT, TAX_FLAG'+#13+
   'from data0432'+#13+
   'where qte_ptr = '+inttostr(rkey85)+#13+
   'and addl_cat_ptr is not null';
 open;
 while not eof do
  begin
   for i:=1 to sgrid.RowCount-2 do
   if FieldValues['ADDL_CAT_PTR']=strtoint(sgrid.Cells[5,i]) then
    begin
     sgrid.Cells[1,i]:=fieldbyname('AMOUNT').AsString;
     sgrid.Cells[3,i]:=fieldbyname('FREE_AMOUNT').AsString;
     sgrid.Cells[4,i]:=fieldbyname('TAX_FLAG').AsString;
     break;
    end;
   Next;
  end;
end;
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;


procedure tform1.checkvar();
begin
 dm.ADOQuery1.Close;
 dm.ADOQuery6.Close;
if not checkbox1.Checked then
 begin
  dm.ADOQuery1.Parameters[0].Value:=1;      //有效的
  dm.ADOQuery6.Parameters[0].Value:=1;
 end
else
 begin
  dm.ADOQuery1.Parameters[0].Value:=0;
  dm.ADOQuery6.Parameters[0].Value:=0;
 end;
if not checkbox2.Checked then             //暂缓
 begin
  dm.ADOQuery1.Parameters[1].Value:=2;
  dm.ADOQuery6.Parameters[1].Value:=2;
 end
else
 begin
  dm.ADOQuery1.Parameters[1].Value:=0;
  dm.ADOQuery6.Parameters[1].Value:=0;
 end;
if not checkbox3.Checked then           //已结算
 begin
  dm.ADOQuery1.Parameters[2].Value:=3;
  dm.ADOQuery6.Parameters[2].Value:=3;
 end
else
 begin
  dm.ADOQuery1.Parameters[2].Value:=0;
  dm.ADOQuery6.Parameters[2].Value:=0;
 end;
if not checkbox4.Checked then           //已完成
 begin
  dm.ADOQuery1.Parameters[3].Value:=4;
  dm.ADOQuery6.Parameters[3].Value:=4;
 end
else
 begin
  dm.ADOQuery1.Parameters[3].Value:=0;
  dm.ADOQuery6.Parameters[3].Value:=0;
 end;
//if not checkbox5.Checked then           //已取消
// begin
//  dm.ADOQuery1.Parameters[4].Value:=5;
//  dm.ADOQuery6.Parameters[4].Value:=5;
// end
//else
// begin
//  dm.ADOQuery1.Parameters[4].Value:=0;
//  dm.ADOQuery6.Parameters[4].Value:=0;
// end;
if not checkbox6.Checked then           //未提交
 begin
  dm.ADOQuery1.Parameters[5].Value:=6;
  dm.ADOQuery6.Parameters[5].Value:=6;
 end
else
 begin
  dm.ADOQuery1.Parameters[5].Value:=0;
  dm.ADOQuery6.Parameters[5].Value:=0;
 end;

 DM.adoquery1.open;
 DM.adoquery6.open;
end;

procedure TForm1.N5Click(Sender: TObject);

begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
 end
ELSE
 try
  form2:=tform2.Create(application);
  form2.ShowModal;
 finally
  form2.free;

 end;
end;

procedure TForm1.N6Click(Sender: TObject);   //编辑
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;
  if dm.ADOQuery1D60STATUS.Value<>4 then  //订单没有变成完成状态
  begin
    with dm.ADOQuery5 do
    begin
      close;
      sql.Clear;
      sql.Add('select rkey from data0090');
      sql.Add('where auth_date is not null and');
      sql.Add('pact_ptr='+dm.ADOQuery1D60RKEY.AsString);
      open;
    end;
    if (not dm.ADOQuery5.IsEmpty ) and (dm.ADOQuery1QUOTE_PRICE.AsInteger<>2) then
    begin
      MessageDlg('该订单的合同已有评审人员,不允许编辑',mtInformation,[mbCancel],0);
      Exit;
    end
    else
    begin
      v_con:=0;
      dm.Aq0060.Close;
      dm.Aq0060.Parameters.ParamByName('@d60rkey').Value:=dm.ADOQuery1D60RKEY.Value;
      dm.Aq0060.Open;
      dm.ADOQuery4.Close;
      dm.ADOQuery4.Parameters[0].Value:= dm.ADOQuery1D60RKEY.Value;
//      dm.ADOQuery4.Parameters[1].Value:=dm.ADOQuery1D60RKEY.Value;//存储过程
      dm.ADOQuery4.Open;
      dm.ADOQuery4.Edit;
      Form8:=Tform8.Create(Application);
      if dm.ADOQuery1D60PROD_REL.Value<>'1' then //订单已确认或投产
      begin
        form8.Edit4.Enabled := false;      //客户部件
        form8.BitBtn3.Enabled := false;
        form8.Label67.Enabled := false;
        Form8.Label104.Enabled:=False;//客户物料号
        form8.DBEdit13.Enabled := false;   //数量
        form8.DBEdit12.Enabled := false;   //数量set
        form8.DBEdit14.Enabled := false;
        form8.DBEdit25.Enabled := false;
        form8.MaskEdit1.Enabled := false;  //交货期
        form8.MaskEdit2.Enabled := false;
        form8.MaskEdit4.Enabled := false;
      end;
      form8.rkey213_old:=dm.ADOQuery1rkey213.Value;
      Form8.rkey213_new:=Form8.rkey213_old;
      form8.old213Num:=dm.ADOQuery1PARTS_ORDERED.Value;
      //20161019tang添
      if (dm.ADOQuery1.fieldbyname('BPNO').AsString<>'') then
      Form8.Label49.Caption:='Bom报价编号：'+dm.ADOQuery1.fieldbyname('BPNO').AsString;
      form8.Edit14.Text:=dm.adoquery1CPJS.AsString;
      //end20161019
      if dm.ADOQuery1rkey213.Value>0 then
      begin
        Form8.BitBtn3.Enabled:=False;
        Form8.BitBtn4.Enabled:=False;
        Form8.DBEdit13.ReadOnly:=True;
        Form8.DBEdit14.ReadOnly:=True;
        Form8.DBEdit25.ReadOnly:=True;
        form8.BitBtn13.Enabled:=False;
      end;
      form8.ShowModal;
      form8.free;
      dm.Aq0060.Close;
    end;
  end
  else
  if messagedlg('销售订单已完成,需要编辑记事本吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    try
      edit_note:=Tedit_note.Create(application);
      edit_note.Caption:='销售订单记事本:'+dm.ADOQuery1D60SALES_ORDER.Value;
      with dm.ADOQuery3 do
      begin
        if active=true then active:=false;
        sql.Clear;
        sql.Add('select RemarkSO from data0060 where Rkey='+dm.ADOQuery1.fieldbyname('D60RKEY').AsString);
        active:=true;
        if not isempty then
          edit_note.Memo1.Lines.Add(fieldbyname('RemarkSO').AsString);
      end;
      if edit_note.ShowModal=mrok then
      begin
        if (not dm.ADOQuery3.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
        begin             //原记录有记事本而且修改了
          dm.ADOQuery3.Edit;
          dm.ADOQuery3.fieldbyname('RemarkSO').asstring:=edit_note.Memo1.Lines.Text;
          dm.ADOQuery3.Post;
//        end
//        else
//        if (not dm.AQ9711.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
//          dm.AQ9711.Delete
//        else
//        if (dm.AQ9711.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
//        begin
//          dm.AQ9711.Append;
//          dm.AQ9711.FieldByName('file_pointer').AsString:=dm.ADOQuery1.fieldbyname('d60rkey').AsString;
//          dm.AQ9711.Fieldvalues['source_type']:=60;
//          dm.AQ9711.fieldbyname('memo_text').asstring:=edit_note.Memo1.Lines.Text;
//          dm.AQ9711.post;
        end;
      end;
    finally
      edit_note.free;
    end;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 N3.Enabled := false;  //暂缓
 N8.Enabled := true; //从暂缓中释放
 N6.Enabled := true;  //编辑
 n13.Enabled := false;      //结案
 n14.Enabled := true;   //从结案中起动
 n7.Enabled := true; //检查
 n16.Enabled := false; //提交
 n18.Enabled := true;
 n19.Enabled := true;
 n22.Enabled := true;
 n23.Enabled := false;  //删除
case dm.ADOQuery1D60STATUS.Value of
1:
 begin//有效
  n3.Enabled := true;   //暂缓
  N8.Enabled := false;  //从暂缓中释放
  n13.Enabled := true;
  n14.Enabled:=false;
  if dm.ADOQuery1D60PROD_REL.Value='1' then
   n23.Enabled :=true
  else
   n23.Enabled :=false;
 end;
2:
 begin //暂缓
  n14.Enabled := false;
  N6.Enabled := false;
 end;
3:
 begin   //关闭
  N8.Enabled := false;   //从暂缓中释放
  N6.Enabled := false;
 end;
4:
 begin //完成
  n14.Enabled := false;
  N8.Enabled := false;   //从暂缓中释放
 end;
5:
 begin //取消
  n6.Enabled := false;   //编辑
  n14.Enabled := false;
  N8.Enabled := false;   //从暂缓中释放
 end;
6:
 begin//未提交
  n3.Enabled := true;   //暂缓
  N8.Enabled := false;  //从暂缓中释放
  n14.Enabled:=false;  
  n13.Enabled := true;
  n16.Enabled := true;
  n23.Enabled := true;  //删除
 end;
else
 begin //空记录
  N8.Enabled := false;  //从暂缓中释放
  N6.Enabled := false;  //编辑
  n14.Enabled:=false;
  n7.Enabled := false;  //检查
  n16.Enabled := false; //提交
  n18.Enabled := false; //评审信息
  n19.Enabled := false; //报表
  n22.Enabled := false;  //销售订单变更
  n23.Enabled := false;  //删除
 end;
end;
  
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
 info:string;
begin
 if (dm.ADOQuery1quote_price.Value=2)  then
  begin
   with dm.ADOQuery3 do
    begin
     close;
     sql.Clear;
     sql.Add('select employee_name from data0005');
     sql.Add('where rkey='+dm.ADOQuery1rma_ptr.AsString);
     open;
     info := '该销售订单由员工:'+trim(fieldvalues['employee_name'])+'  于日期'+#13;
     info := info+dm.ADOQuery1mfg_order_date.AsString+'退回,退回原因如下:'+#13;
    end;
   with dm.ADOQuery3 do
    begin           //查找记事本
     if active = true then active := false;
     sql.Clear;
     sql.Add('select * from data0011 where source_type=97');
     sql.Add('and file_pointer='+dm.ADOQuery1PURCHASE_ORDER_PTR.AsString);
     active := true;
     if not isempty then
      info:=info+Fieldbyname('memo_text').AsString+#13;
    end;
   showmessage(info);
   dm.ADOQuery3.Close;
  end
 else
  begin
   N7Click(Sender);
  end;
end;


procedure TForm1.N3Click(Sender: TObject);
var
 rkey60:integer;

begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
 end
 else
  begin
   try
    edit_note:=Tedit_note.Create(application);
    edit_note.Label9.Caption:=' 关联文件号/暂停原因:';
    edit_note.iMenu:=0;// 暂停
    edit_note.Caption:='销售订单记事本,置于暂缓:'+dm.ADOQuery1D60SALES_ORDER.Value;
    
    with dm.ADOQuery3 do
     begin
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select RemarkSO from data0060 where Rkey='+dm.ADOQuery1.fieldbyname('D60RKEY').AsString);
      active:=true;
      if not isempty then edit_note.Memo1.Text := fieldvalues['RemarkSO']; //memo_text
     end;
    if edit_note.ShowModal=mrok then
     begin
      if (not dm.ADOQuery3.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
       begin             //原记录有记事本而且修改了
        dm.ADOQuery3.Edit;
        dm.ADOQuery3.FieldValues['RemarkSO']:=edit_note.Memo1.Text;
        dm.ADOQuery3.Post;
//       end
//      else
//       if (not dm.AQ9711.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
//        dm.AQ9711.Delete
//       else
//        if (dm.AQ9711.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
//         begin
//          dm.AQ9711.Append;
//          dm.AQ9711.FieldByName('file_pointer').AsString:=dm.ADOQuery1.fieldbyname('d60rkey').AsString;
//          dm.AQ9711.Fieldvalues['source_type']:=60;
//          dm.AQ9711.FieldValues['memo_text']:=edit_note.Memo1.Text;
//          dm.AQ9711.post;
         end;

     dm.ADOQuery4.Close;
      dm.ADOQuery4.Parameters[0].Value:=dm.ADOQuery1D60RKEY.Value;
//     dm.ADOQuery4.Parameters[1].Value:=dm.ADOQuery1D60RKEY.Value;
     dm.ADOQuery4.Open;

     dm.ADOQuery4.Edit;
     dm.ADOQuery4.FieldValues['status']:=2;  //暂缓
     dm.adoquery4.post;

    with dm.ADOQuery5 do
    begin
     close;                  //记录销售订单状态更改(日志文件)
     sql.Clear;
     sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
     sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)');
     sql.Add('values ('+dm.ADOQuery1D60RKEY.AsString+',10,''更改销售订单状态为缓暂'',');
     sql.Add(''''+dm.ADOQuery1status.Value+''',''暂缓'','+rkey73+',getdate(),');
     sql.Add('32,'''+trim(edit_note.Edit1.Text)+''')');
     ExecSQL;
    end;

   with dm.ado06 do
    begin
     close;
     Parameters.ParamByName('@v_flag').Value:=1;
     Parameters.ParamByName('@d60sales_order').Value:=dm.ADOQuery1D60SALES_ORDER.Value;
     open;
     while not eof do
      begin
       if dm.ado06PROD_STATUS.Value=4 then
        with dm.ADOQuery5 do
         begin
         close;
         sql.Clear;
         sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('+dm.ado06rkey.AsString+',2,'+User_ptr+',getdate(),1,'+QuotedStr('市场订单暂缓导致外发工单暂缓')+')';
         ExecSQL;
         end
        else
         with dm.ADOQuery5 do
         begin
         close;
         sql.Clear;
         sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('+dm.ado06rkey.AsString+',2,'+User_ptr+',getdate(),1,'+QuotedStr('市场订单暂缓导致工单暂缓')+')';
         ExecSQL;
         end;
       edit;
       if dm.ado06PROD_STATUS.Value=2 then
        dm.ado06PROD_STATUS.Value:=102
       else
        dm.ado06PROD_STATUS.Value:=103;
       post;
       next;
      end;
     close;
    end;

     rkey60:=dm.ADOQuery1d60rkey.Value;
     dm.ADOQuery1.Close;
     dm.ADOQuery1.Open;
     dm.ADOQuery1.Locate('d60rkey',rkey60,[]);
    end;
   finally
    edit_note.free;
   end;
  end;
end;

procedure TForm1.N8Click(Sender: TObject);
var
 rkey60:integer;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 begin
  try
   edit_note:=Tedit_note.Create(application);
   edit_note.Label9.Caption:=' 文件号/暂缓启动原因:';
   edit_note.iMenu:=1;//重起
   edit_note.Caption:='从暂缓中释放:'+dm.ADOQuery1D60SALES_ORDER.Value;
   with dm.ADOQuery3 do
    begin
     if active = true then active := false;
     sql.Clear;
     sql.Add('select RemarkSO from data0060 where  Rkey='+dm.ADOQuery1.fieldbyname('D60RKEY').AsString);
     active:=true;
     if not isempty then edit_note.Memo1.Text := fieldvalues['RemarkSO'];
    end;
     if edit_note.ShowModal=mrok then
      begin
       if (not dm.ADOQuery3.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
        begin             //原记录有记事本而且修改了
         dm.ADOQuery3.Edit;
         dm.ADOQuery3.FieldValues['RemarkSO']:=edit_note.Memo1.Text;
         dm.ADOQuery3.Post;
//        end
//       else
//        if (not dm.AQ9711.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
//         dm.AQ9711.Delete
//        else
//         if (dm.AQ9711.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
//          begin
//          dm.AQ9711.Append;
//          dm.AQ9711.FieldByName('file_pointer').AsString:=dm.ADOQuery1.fieldbyname('d60rkey').AsString;
//          dm.AQ9711.Fieldvalues['source_type']:=60;
//          dm.AQ9711.FieldValues['memo_text']:=edit_note.Memo1.Text;
//          dm.AQ9711.post;
          end;
     dm.ADOQuery4.Close;
      dm.ADOQuery4.Parameters[0].Value:=dm.ADOQuery1D60RKEY.Value;
//     dm.ADOQuery4.Parameters[1].Value:=dm.ADOQuery1D60RKEY.Value;
     dm.ADOQuery4.Open;
     dm.ADOQuery4.Edit;
     dm.ADOQuery4.FieldValues['status']:=1;   //有效
     dm.adoquery4.post;

    with dm.ADOQuery5 do
     begin
      close;                  //记录销售订状态更改情况(日志文件)
      sql.Clear;
      sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
      sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)');
      sql.Add('values ('+dm.ADOQuery1D60RKEY.AsString+',10,''更改销售订单状态为有效'',');
      sql.Add(''''+dm.ADOQuery1status.Value+''',''有效的'','+rkey73+',');
      sql.add('getdate(),32,'''+trim(edit_note.Edit1.Text)+''')');
      ExecSQL;
     end;

   with dm.ado06 do
    begin
     close;
     Parameters.ParamByName('@v_flag').Value:=2;
     Parameters.ParamByName('@d60sales_order').Value:=dm.ADOQuery1D60SALES_ORDER.Value;
     open;
     while not eof do
      begin
       edit;
       if dm.ado06PROD_STATUS.Value=102 then
        dm.ado06PROD_STATUS.Value:=2
       else
        dm.ado06PROD_STATUS.Value:=3;
       post;
       with dm.ADOQuery5 do
        begin
         close;
         sql.Clear;
         sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
          ' values ('+dm.ado06rkey.AsString+',2,'+User_ptr+',getdate(),2,'+QuotedStr('市场订恢复导致工单恢复')+')';
         ExecSQL;
        end;
       next;
      end;
     close;
    end;
     rkey60:=dm.ADOQuery1d60rkey.Value;
     dm.ADOQuery1.Close;
     dm.ADOQuery1.Open;
     dm.ADOQuery1.Locate('d60rkey',rkey60,[]);
    end;
   finally
    edit_note.free;
   end;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
//20160308Tang修改去掉菜单
//if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
// begin
//  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
//  exit;
// end;
// try
//  form9:=Tform9.Create(Application);
//  if form9.ShowModal=mrok then
//   begin
//    dm.ADOQuery1.Close;
//    dm.ADOQuery1.Open;
//   end;
// finally
//  form9.free;
// end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
//20160308Tang修改去掉菜单
//if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
// begin
//  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
//  exit;
// end;
// try
//  form10:=Tform10.Create(Application);
//  if form10.ShowModal=mrok then
//   begin
//    dm.ADOQuery1.Close;
//    dm.ADOQuery1.Open;
//   end;
// finally
//  form10.free;
// end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
 dm.ADOQuery1.First;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
 dm.ADOQuery1.Last;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
 dm.ADOQuery1.Prior;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 dm.ADOQuery1.next;
end;

procedure TForm1.N7Click(Sender: TObject);

begin
if not dm.ADOQuery1.IsEmpty then
 try
   dm.ADOQuery4.Close;
      dm.ADOQuery4.Parameters[0].Value:=dm.ADOQuery1D60RKEY.Value;
//   dm.ADOQuery4.Parameters[1].Value:=dm.ADOQuery1D60RKEY.Value;
   dm.ADOQuery4.Open;
   dm.ADO360.Parameters[0].Value:=dm.ADOQuery1D60RKEY.Value;
   Form8:=Tform8.Create(Application);
   form8.Edit4.ReadOnly := true;   //生产编号
   form8.Edit2.Enabled := false;
   form8.BitBtn11.Enabled := false; //工厂代码
   form8.BitBtn2.Enabled := false;
   form8.BitBtn3.Enabled := false;
   form8.BitBtn4.Enabled := false;
   form8.BitBtn5.Enabled := false; //使部件价格不可修改
   form8.BitBtn13.Enabled:=False;  //预处理不可选择
   form8.BitBtn6.Enabled := false;
   form8.Label67.Enabled := false;
   form8.Label104.Enabled:=False;//客户物料号
   form8.DBEdit13.ReadOnly := true;
   form8.MaskEdit1.Enabled := false;
   form8.MaskEdit2.Enabled := false;
   form8.MaskEdit4.Enabled := false;
   form8.Button1.Visible := false;
   form8.Button2.Visible := false;
   form8.Button3.Visible := true;
   form8.Edit6.ReadOnly := true;     //采购订单编号
   form8.ComboBox1.Enabled := false;
   form8.DBEdit11.ReadOnly := true;
   form8.MaskEdit3.ReadOnly := true;
   form8.Edit8.Enabled := false;
   form8.DBEdit7.ReadOnly := true;
   form8.DBEdit8.ReadOnly := true;
   form8.DBEdit9.ReadOnly := true;
   form8.DBEdit10.ReadOnly := true;

   form8.DBCheckBox2.ReadOnly := true;
   form8.DBCheckBox3.ReadOnly := true;
   form8.DBEdit12.ReadOnly := true;
   form8.DBEdit25.ReadOnly := true;
   form8.DBEdit14.ReadOnly := true;
   form8.DBEdit15.ReadOnly := true;
   form8.DBEdit16.ReadOnly := true;
//20161114tang修改
//   form8.DBEdit17.ReadOnly := true;
   Form8.ComboBox3.Enabled:=false;
   form8.DBEdit18.ReadOnly := true;
   form8.DBEdit19.Enabled := false;
   form8.DBEdit20.Enabled := false;
   form8.DBEdit21.Enabled := false;
   form8.DBCheckBox4.ReadOnly := true;
   //form8.stringgrid1.Enabled := false;
   form8.stringgrid2.Enabled := false;
   form8.DBEdit1.ReadOnly := true;
   form8.DBEdit2.ReadOnly := true;
   form8.DBEdit3.ReadOnly := true;
   form8.DBEdit4.ReadOnly := true;
   form8.DBEdit5.ReadOnly := true;
   form8.BitBtn8.Enabled := false;  //更改货币
   form8.DBGrid1.ReadOnly := TRUE;
   form8.DBComboBox1.ReadOnly := true;
   form8.Memo1.Enabled:=false;
   form8.Memo2.Enabled:=false;
   form8.SpeedButton1.Enabled:=false;
   form8.DBEdit24.Enabled:=false;
   form8.BitBtn9.Enabled:=false;
   form8.SpeedButton2.Enabled:=false;
   form8.Edit9.Enabled:=false;
   form8.DBRadioGroup1.Enabled:=false;
   form8.BitBtn10.Enabled:=false;
   form8.DBRadioGroup2.ReadOnly:=true;
   form8.DBComboBox2.Enabled:=false;
  //20161019tang添
    if (dm.ADOQuery1.fieldbyname('BPNO').AsString<>'') then
    Form8.Label49.Caption:='Bom报价编号：'+dm.ADOQuery1.fieldbyname('BPNO').AsString;
    form8.Edit14.Text:=dm.adoquery1CPJS.AsString;
  //end20161019
//   Form8.BitBtn7.Enabled:=False;    //允许检查状态下编辑记事本20160309tang
//   form8.Memo3.Enabled:=False;
    form8.Edit17.Enabled:=False;
    form8.BitBtn14.Enabled:=False;
   form8.ShowModal;
 finally
  form8.free;
 end
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
//form_condition:=tform_condition.Create(application);
form_condition.dtpk1.Date:=dm.adoquery1.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.adoquery1.Parameters.ParamValues['dtpk2']-1;

if form_condition.ShowModal=mrok then
 begin
  checkvar;
  dm.adoquery1.Close;
  dm.adoquery1.CommandText:=sql_text;
  dm.ADOQuery6.Close;
  dm.ADOQuery6.SQL.Text:=total_sqltext;

  for i:=1 to form_condition.SGrid1.RowCount-2 do
  begin
   dm.adoquery1.CommandText:=dm.adoquery1.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
   dm.adoquery6.SQL.Text:=dm.adoquery6.sql.Text+
   form_condition.SGrid1.Cells[2,i]+#13;
  end;
  dm.adoquery1.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.adoquery1.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date+1;
  dm.adoquery6.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.adoquery6.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date+1;
  dm.ADOQuery1.Prepared;
  dm.ADOQuery6.Prepared;  
  dm.adoquery1.Open;
  dm.adoquery6.Open;
 end;
//form_condition.Free;
end;

procedure TForm1.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbGrid1.FieldCount - 1 do
    if dbGrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbGrid1.Columns[i].Visible := true;
      break;
    end;
  end else begin
    for i := 0 to dbGrid1.FieldCount - 1 do
    if dbGrid1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbGrid1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 v_date:string;
 i:integer;
 item:TMenuItem;
begin
if DM.Adoconnection1.Connected then
 begin

  field_name := DBGrid1.Columns[0].FieldName;
  PreColumn := DBGrid1.Columns[0];
  with dm.adoquery5 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR from data0073');
    sql.Add('where rkey='+rkey73);
    open;
    enter_empl_ptr.Caption := fieldbyname('employee_ptr').asstring;
    user_ptr:=fieldbyname('employee_ptr').asstring;
   end;

  v_date:= datetostr(getsystem_date(DM.ADOQuery5,1));
  dm.AQ04.Close;    //根据当前日期判断是否修改订单编号初始值
  dm.AQ04.Open;
  if copy(dm.AQ04.FieldByName('SEED_VALUE').AsString,1,6)<>
         (copy(v_date,3,2)+
          copy(v_date,6,2)+
          copy(v_date,9,2)) then
   begin
    dm.AQ04.Edit;
    dm.AQ04.FieldByName('SEED_VALUE').AsString:=(copy(v_date,3,2)+copy(v_date,6,2)+copy(v_date,9,2))+'001';
    dm.AQ04.Post;
   end;
  dm.AQ04.Close;
  
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  dm.ADOQuery1.CommandText:= dm.ADOQuery1.CommandText+
  'and data0060.customer_ptr in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')'+#13;
  dm.ADOQuery6.SQL.Text:=dm.ADOQuery6.SQL.Text+
  'and data0060.customer_ptr in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+')'+#13;
 end;
  checkvar;
  dm.ADOQuery1.Close;
  dm.ADOQuery6.Close;
  dm.ADOQuery1.Parameters[6].Value:=getsystem_date(DM.ADOQuery5,1);
  dm.ADOQuery6.Parameters[6].Value:=getsystem_date(DM.ADOQuery5,1);
  dm.ADOQuery1.Parameters[7].Value:=getsystem_date(DM.ADOQuery5,1)+1;
  dm.ADOQuery6.Parameters[7].Value:=getsystem_date(DM.ADOQuery5,1)+1;
  dm.ADOQuery1.Prepared;
  dm.ADOQuery6.Prepared;
  dm.ADOQuery1.Open;
  dm.ADOQuery6.Open;
  sql_text := dm.ADOQuery1.CommandText;
  total_sqltext:=dm.ADOQuery6.SQL.Text;

  for i := 1 to dbGrid1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := dbGrid1.Columns[i - 1].Title.Caption;
    item.Checked :=dbGrid1.Columns[i - 1].Visible ;
    item.OnClick := item_click ;
    PMFlds.Items.Add(item) ;
  end;

  with StringGrid1 do
  begin
    StringGrid1.ColCount:=10;
    StringGrid1.RowCount:=2;
    Cells[0,0]:='客户型号';
    Cells[1,0]:='客户订单号';
    Cells[2,0]:='客户物料号';
    Cells[3,0]:='订单数量';
    Cells[4,0]:='输入日期';
    Cells[5,0]:='销售订单号';
    Cells[6,0]:='本厂编号(填)';
    Cells[7,0]:='客户代码(填)';
    Cells[8,0]:='外发指定供应商(填)';
    Cells[9,0]:='工厂(填)';
    StringGrid1.ColWidths[0]:=150;
    StringGrid1.ColWidths[1]:=120;
    StringGrid1.ColWidths[2]:=130;
    StringGrid1.ColWidths[3]:=60;
    StringGrid1.ColWidths[4]:=100;
    StringGrid1.ColWidths[5]:=80;
  end;
end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (COlumn.FieldName = 'D60SCH_DATE') and
    (dm.ADOQuery1D60SCH_DATE.AsVariant<>null) and
    (dm.ADOQuery1D60SCH_DATE.Value>dm.ADOQuery1ORIG_SCHED_SHIP_DATE.Value) then
  begin
    dbgrid1.Canvas.Brush.color:=clyellow;
    dbgrid1.Canvas.Font.Color :=clblue;
    dbgrid1.Canvas.pen.mode:=pmmask;
    dbgrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;

 if (dm.ADOQuery1D60STATUS.Value = 1) and (dm.ADOQuery1quote_price.Value=2) then
  DBGrid1.Canvas.Font.Color := clred
 else
  if dm.ADOQuery1D60STATUS.Value = 6 then     //未提交
  begin
   DBGrid1.Canvas.Font.Color :=clLime;
  end else
   if (dm.ADOQuery1D60STATUS.Value=2) or (dm.ADOQuery1D60STATUS.Value=3) or
   (dm.ADOQuery1D60STATUS.Value=5) then      //暂缓,关闭,取消
     DBGrid1.Canvas.Font.Color := clfuchsia;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TForm1.N16Click(Sender: TObject);  //提交评审
var
 v_prod:byte;
 v_amt_ltd:integer;
 v_amount:double;
 sName:string;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
   messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
   exit;
  end;
 //20161219tang修改提交之前查看订单版本是否无效，并提示新版本---
  dm.qrytmp.Close;
  dm.qrytmp.SQL.Text:='select ONHOLD_SALES_FLAG from data0025 where rkey='+dm.ADOQuery1CUST_PART_PTR.AsString;
  dm.qrytmp.Open;
  if (dm.qrytmp.FieldByName('ONHOLD_SALES_FLAG').AsInteger=1) then
  begin
    dm.Ado273_25.Close;
    dm.Ado273_25.Parameters.ParamByName('Rkey25').Value:=dm.ADOQuery1CUST_PART_PTR.Value;
    dm.Ado273_25.Open;
    if not dm.Ado273_25.IsEmpty then
    begin
      sName:=Trim(dm.Ado273_25.FieldByName('MANU_PART_NUMBER').AsString);
    end else
    begin
      sName:='空';
    end;
    if messagedlg('当前销售单已暂停销售，升级的本厂编号为【'+sName+'】，是否继续?',mtConFirmation,[mbYes,mbNo],0)= mrNo then Exit;
  end;

  //20170619zgp本厂编号未提交，订单无法提交---
  dm.qrytmp.Close;
  dm.qrytmp.SQL.Text:='select TSTATUS from data0025 where rkey='+dm.ADOQuery1CUST_PART_PTR.AsString;
  dm.qrytmp.Open;
    if (dm.qrytmp.FieldByName('TSTATUS').AsInteger=6) then
  begin
     Application.MessageBox('本厂编号未提交，订单无法提交','提示',0+64);
      Exit;
  end;

 //end 20161219tang
 dm.aq192.Open;
 v_prod:=2;
 v_amt_ltd:=0;
 v_amount:=0;
 with dm.ADOQuery5 do
 begin
  close;
  sql.Clear;
  sql.Add('select prod_conf,so_amt_ltd from data0119');
  sql.Add('where CUST_PART_PTR='+dm.ADOQuery1CUST_PART_PTR.AsString);
  open;
  if not IsEmpty then
   begin
    if fieldvalues['prod_conf']<>null then
     v_prod:=fieldvalues['prod_conf'];
    if fieldvalues['so_amt_ltd']<>null then
     v_amt_ltd:=fieldvalues['so_amt_ltd'];
   end;
 end;
with dm.ADOQuery5 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT CUST_PART_PTR, PURCHASE_ORDER_PTR,');
  sql.Add('ROUND(SUM(PARTS_ORDERED * (PART_PRICE * (1 - DISCOUNT * 0.01))');
  sql.Add('/ EXCH_RATE), 4) AS amount');
  sql.Add('FROM Data0060');
  sql.Add('where CUST_PART_PTR ='+dm.ADOQuery1CUST_PART_PTR.AsString);
  sql.Add('and PURCHASE_ORDER_PTR ='+dm.ADOQuery1PURCHASE_ORDER_PTR.AsString);
  sql.Add('GROUP BY CUST_PART_PTR, PURCHASE_ORDER_PTR');
  open;
  if not isempty then v_amount:=fieldvalues['amount'];
 end;

if (dm.aq192ppc_control15.Value=1) then
 begin
  if v_prod=2 then
   self.pact_auth()
  else
   if v_prod=0 then
    showmessage('该订单无法提交,因为板号没有通过转产确认!')
   else
    begin
     if v_amount <= v_amt_ltd then
      self.pact_auth()
     else
      showmessage('该订单无法提交,因为订单总金额大于了板号可转产的总金额!');
    end;
 end
else
 self.pact_auth();

end;

procedure TForm1.N18Click(Sender: TObject);
begin
 form_deptinfo := tform_deptinfo.Create(application);
 dm.Aqinfor90.Close;
 dm.Aqinfor90.Parameters.ParamByName('@d60rkey').Value:=dm.ADOQuery1D60RKEY.Value;
 dm.Aqinfor90.Open;
 form_deptinfo.ShowModal;
 form_deptinfo.Free;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbgrid1dblclick(sender);
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.adoquery1.CommandText);
end;

procedure tform1.note_information(title,value:string; v_type:word);
begin
form11:=tform11.Create(application);
form11.Caption := title+value+'变更记录';
with dm.ADOQuery5 do
 begin
  close;
  sql.Clear;
  sql.Add('select user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, ');
  sql.Add('FROM_STRING,TO_STRING,file_number');
  sql.Add('from data0318 inner join data0073 on');
  sql.Add('data0318.user_ptr=data0073.rkey');
  if v_type=60 then
   sql.Add('where sales_ORDER_PTR='+dm.ADOQuery1D60RKEY.AsString)
  else
   if v_type=97 then
    sql.Add('where work_ORDER_PTR='+dm.ADOQuery1PURCHASE_ORDER_PTR.AsString);
  open;
 end;
while not dm.ADOQuery5.Eof do
 begin
  form11.Memo1.Lines.Add(dm.ADOQuery5.fieldbyname('trans_date').AsString+
  ' 系统用户:'+dm.ADOQuery5.fieldbyname('user_id').AsString+' '+
  dm.ADOQuery5.fieldbyname('user_full_name').AsString+
  dm.ADOQuery5.fieldbyname('TRANS_DESCRIPTION').AsString);
  form11.Memo1.Lines.Add(' 原值: '+dm.ADOQuery5.fieldbyname('from_string').AsString+
  ' 变更后: '+dm.ADOQuery5.fieldbyname('to_string').AsString+
  '   文件号/原因:'+dm.ADOQuery5.fieldbyname('file_number').AsString);

  dm.ADOQuery5.Next;
 end;
form11.ShowModal;
form11.Free;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
self.note_information('销售订单: ',dm.ADOQuery1D60SALES_ORDER.Value,60);
end;

procedure TForm1.N23Click(Sender: TObject);
begin
   dm.ADOQuery4.Close;
   dm.ADOQuery4.Parameters[0].Value:=dm.ADOQuery1D60RKEY.Value;
//   dm.ADOQuery4.Parameters[1].Value:=dm.ADOQuery1D60RKEY.Value;
   dm.ADOQuery4.Open;
if (strtoint(vprev)=1) or
   (strtoint(vprev)=3) or
   (strtoint(rkey73)<>dm.ADOQuery4.FieldValues['CSI_USER_PTR']) then
 begin
  messagedlg('对不起,您没有可写权限!或者该订单不是您输入的',mtinformation,[mbok],0);
  dm.ADOQuery4.Close;
 end
else
if messagedlg('您确定要删除该条记录吗?',mtConfirmation,[mbYes,mbNo],0)= mrYes then
 begin
  dm.ADOConnection1.BeginTrans;
//20160308tang修改取消11表 状态是(SOURCE_TYPE=60) or (SOURCE_TYPE=1060)
//  with dm.ADOQuery3 do
//   begin
//    close;
//    sql.Clear;
//    sql.Add('select * from data0011');
//    sql.Add('where ((SOURCE_TYPE=60) or (SOURCE_TYPE=1060))');
//    sql.Add('and FILE_POINTER='+dm.ADOQuery1D60RKEY.AsString);
//    open;
//   end;
//  while not dm.ADOQuery3.Eof do dm.ADOQuery3.Delete;
  try
   if dm.ADOQuery1rkey213.Value>0 then //从预处理订单信息下的正式订单
   begin
    with dm.ADOQuery5 do
    begin
      Close;
      sql.Clear;
      sql.Add('update data0213 set status=3,UsedQuantity=isNull(UsedQuantity,0)-'+dm.ADOQuery1PARTS_ORDERED.AsString+' where rkey='+dm.ADOQuery1rkey213.AsString);
      ExecSQL;
    end;
   end;
   dm.ADOQuery4.Delete;
   dm.ADOConnection1.CommitTrans;
   showmessage('数据成功删除!!!');
   dm.ADOQuery1.Close;
   dm.ADOQuery6.Close;
   dm.ADOQuery1.Open;
   dm.ADOQuery6.Open;
   dm.ADOQuery4.Close;
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据删除不成功,可能是已经有投产记录产生了配料单492');
  end;
 end
else
 dm.ADOQuery4.Close; 
end;

procedure TForm1.aq97update;  //准备增加合同审批的部门子表
begin
 with dm.ado90 do
  begin
   close;
   Parameters[1].Value := dm.ADOQuery1d60rkey.Value;
   open;
   while not eof do Delete;
  end;

 with dm.ADOQuery5 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT data0091.dept_ptr,data0091.if_puthdate,data0091.puth_info');
   sql.Add('FROM data0091 INNER JOIN');
   sql.Add('Data0007 ON data0091.group_ptr = Data0007.RKEY INNER JOIN');
   sql.Add('Data0008 ON Data0007.RKEY = Data0008.PR_GRP_POINTER INNER JOIN');
   sql.Add('Data0025 ON Data0008.RKEY = Data0025.PROD_CODE_PTR');
   sql.Add('where data0025.rkey='+dm.ADOQuery1CUST_PART_PTR.AsString);
   sql.Add('order by data0091.rkey');
   open;
  end;

 while not DM.ADOQuery5.Eof do
  begin
   dm.ado90.Append;
   dm.ado90pact_ptr.Value := dm.ADOQuery1d60rkey.Value;
   dm.ado90dept_ptr.Value := DM.ADOQUERY5.fieldvalues['dept_ptr'];
   dm.ado90if_puthdate.Value:= dm.ADOQuery5.FieldValues['if_puthdate'];
   dm.ado90puth_info.AsVariant := dm.ADOQuery5.FieldValues['puth_info'];
   DM.ado90.Post;
   DM.ADOQuery5.Next;
  end;

end;

procedure TForm1.N24Click(Sender: TObject);
var
 i:word;
 s:string;
begin
 form_report := tform_report.Create(application);

 dm.ado89.close;
 dm.ado89.Parameters[1].Value := dm.ADOQuery1CUST_PART_PTR.Value;
 dm.ado89.Open;

 dm.ado60.Close;
 dm.ado60.Parameters.ParamByName('@purchase_order_ptr').Value:=dm.ADOQuery1PURCHASE_ORDER_PTR.Value;
 dm.ado60.Parameters.ParamByName('@cust_part_ptr').Value:=dm.ADOQuery1CUST_PART_PTR.Value;
 dm.ado60.Open;

 dm.Aqinfor90.Close;//评审部门子表
 dm.Aqinfor90.Parameters.ParamByName('@d60rkey').Value:=dm.ADOQuery1D60RKEY.Value;
 dm.Aqinfor90.Open;


  form_report.ppReport1.Reset;
  form_report.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'sales_order.rtm';
  form_report.ppReport1.Template.LoadFromFile;


 s:='                     ';

 for i:=1 to dm.ado89.RecordCount do
  begin
   if odd(dm.ado89.RecordCount) then
//   if odd(i) then
   if i<=(dm.ado89.RecordCount+1)/2 then
    begin
     form_report.ppMemo1.Lines.Add(' '+trim(dm.ado89parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.ado89parameter_desc.Value)))+
     trim(dm.ado89tvalue.Value)+
     copy(s,1,20-length(trim(dm.ado89tvalue.Value)))+
      dm.ado89unit_name.Value);
    end
   else
    begin
     form_report.ppMemo2.Lines.Add(trim(dm.ado89parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.ado89parameter_desc.Value)))+
     trim(dm.ado89tvalue.Value)+
     copy(s,1,20-length(trim(dm.ado89tvalue.Value)))+
     dm.ado89unit_name.Value);
    end
  else
   if i<=(dm.ado89.RecordCount)/2 then
    begin
     form_report.ppMemo1.Lines.Add(' '+trim(dm.ado89parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.ado89parameter_desc.Value)))+
     trim(dm.ado89tvalue.Value)+
     copy(s,1,20-length(trim(dm.ado89tvalue.Value)))+
      dm.ado89unit_name.Value);
    end
   else
    begin
     form_report.ppMemo2.Lines.Add(trim(dm.ado89parameter_desc.Value)+
     copy(s,1,21-length(trim(dm.ado89parameter_desc.Value)))+
     trim(dm.ado89tvalue.Value)+
     copy(s,1,20-length(trim(dm.ado89tvalue.Value)))+
     dm.ado89unit_name.Value);
    end;
   dm.ado89.Next;
  end;

  form_report.ppReport1.SaveAsTemplate:=false;
  form_report.ppReport1.Print;

 dm.ado89.Close;
 dm.ado60.Close;
 dm.AQ0493.Close;
 dm.ado0278.Close;
 dm.Aqinfor90.Close;
 form_report.Free;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
{ form_mreport:=tform_mreport.Create(application);
 dm.AQ0493.open;
 form_mreport.ADO12.Open;
 form_mreport.ADO60.Open;
 form_mreport.ADO97.Open;
 form_mreport.ADO50.Open;
 form_mreport.ShowModal;
 form_mreport.Free;
} 
end;

procedure TForm1.pact_auth;
begin
 with dm.ADOQuery5 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT data0091.rkey');
   sql.Add('FROM data0091 INNER JOIN');
   sql.Add('Data0007 ON data0091.group_ptr = Data0007.RKEY INNER JOIN');
   sql.Add('Data0008 ON Data0007.RKEY = Data0008.PR_GRP_POINTER INNER JOIN');
   sql.Add('Data0025 ON Data0008.RKEY = Data0025.PROD_CODE_PTR');
   sql.Add('where data0025.rkey='+dm.ADOQuery1CUST_PART_PTR.AsString);
   sql.Add('order by data0091.rkey');
   open;
  end;
  if not dm.ADOQuery5.IsEmpty then
  begin
    dm.ADOQuery1.Edit;
    dm.ADOQuery1D60STATUS.Value := 1;
    if dm.ADOQuery1quote_price.Value=0 then
    begin
      //jacky zhong 2015-11-14 订单保存默认需要提交且未评审，在提交的时候判断，是否需要评审。
      if ((dm.ADOQuery1.FieldByName('ttype').AsInteger=0) and (dm.aq192aptaxontax.Value='Y'))  //量板需要审批
        or ((dm.ADOQuery1.FieldByName('ttype').AsInteger=1) and (dm.aq192artaxontax.Value='Y')) then //样板需要审批
      begin

        if messagedlg('订单未评审是否需要提交评审，请确认?',mtConFirmation,[mbYes,mbNo],0)= mryes then
          self.aq97update()
        else
        begin
          dm.ADOQuery1quote_price.Value:=3;
          dm.ADOQuery1D60SCH_DATE.Value:=dm.ADOQuery1ORIG_SCHED_SHIP_DATE.Value;
        end;
      end
      else
      begin
        dm.ADOQuery1quote_price.Value:=3;
        dm.ADOQuery1D60SCH_DATE.Value:=dm.ADOQuery1ORIG_SCHED_SHIP_DATE.Value;
      end;
    end;
    dm.ADOQuery1.Post;
  end
  else
    showmessage('提交评审操作不成功,请首先设置产品组别的评审部门!');
end;

procedure TForm1.N13Click(Sender: TObject);
var
 rkey60:integer;
 status:string;
begin
if (strtoint(vprev) <> 4) then
  messagedlg('对不起!您没有该订单关闭的权限',mtinformation,[mbok],0)
else
 if messagedlg('您确认要手工结案此销售订单吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  try
  edit_note:=Tedit_note.Create(application);
  edit_note.Caption:='销售订单记事本,关闭:'+dm.ADOQuery1D60SALES_ORDER.Value;
//20160308tang修改            
  edit_note.Label9.Caption:=' 关联文件号/关闭原因:';
  edit_note.iMenu:=2;// 关闭
   with dm.ADOQuery3 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select RemarkSO from data0060 where  Rkey='+dm.ADOQuery1.fieldbyname('D60RKEY').AsString);
    active:=true;
    if not isempty then edit_note.Memo1.Text := fieldvalues['RemarkSO'];
   end;
//end 20160308
  if edit_note.ShowModal=mrok then
   begin
    if (not dm.ADOQuery3.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
     begin             //原记录有记事本而且修改了
      dm.ADOQuery3.Edit;
      dm.ADOQuery3.FieldValues['RemarkSO']:=edit_note.Memo1.Text;
      dm.ADOQuery3.Post;
//     end
//    else
//     if (not dm.AQ9711.IsEmpty) and (trim(edit_note.Memo1.Text)='') then   //如果原记录有记事本但被删除了
//      dm.AQ9711.Delete
//     else
//      if (dm.AQ9711.IsEmpty) and  (trim(edit_note.memo1.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
//       begin
//        dm.AQ9711.Append;
//        dm.AQ9711.FieldByName('file_pointer').AsString:=dm.ADOQuery1.fieldbyname('d60rkey').AsString;
//        dm.AQ9711.Fieldvalues['source_type']:=60;
//        dm.AQ9711.FieldValues['memo_text']:=edit_note.Memo1.Text;
//        dm.AQ9711.post;
       end;

     status:=dm.ADOQuery1status.Value;
     dm.ADOQuery1.Edit;
     dm.ADOQuery1D60STATUS.Value:=3;    //代表关闭
     dm.ADOQuery1.Post;
     with dm.ADOQuery5 do
      begin
       close;                  //记录销售订单数量更改情况(日志文件)
       sql.Clear;
       sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
       sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)');
       sql.Add('values ('+dm.ADOQuery1D60RKEY.AsString+',11,''手工将销售订单结案'',');
       sql.Add(''''+status+''','''+dm.ADOQuery1status.AsString+''','+rkey73+',');
       sql.add('getdate(),32,'''+trim(edit_note.Edit1.Text)+''')');
       ExecSQL;
      end;

     with dm.ado06 do
      begin
       close;
       Parameters.ParamByName('@v_flag').Value:=1;
       Parameters.ParamByName('@d60sales_order').Value:=dm.ADOQuery1D60SALES_ORDER.Value;
       open;
      end;
    if (not dm.ado06.IsEmpty)  and
      (messagedlg('关闭订单的同时暂缓其在线作业单吗?',mtConfirmation,[mbYes,mbNo],0)= mrYes) then
       while not dm.ado06.Eof do
        begin
         if dm.ado06PROD_STATUS.Value=4 then
          with dm.ADOQuery5 do
           begin
           close;
           sql.Clear;
           sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
            ' values ('+dm.ado06rkey.AsString+',2,'+User_ptr+',getdate(),1,'+QuotedStr('市场订单暂缓导致外发工单暂缓')+')';
           ExecSQL;
           end
         else
          with dm.ADOQuery5 do
           begin
           close;
           sql.Clear;
           sql.Text:='insert into data0117(Source_ptr,Source_Type,Empl_ptr,Tdate,Action,Remark) '+
            ' values ('+dm.ado06rkey.AsString+',2,'+User_ptr+',getdate(),1,'+QuotedStr('市场订单暂缓导致工单暂缓')+')';
           ExecSQL;
           end;
         dm.ado06.Edit;
         if dm.ado06PROD_STATUS.Value=2 then
          dm.ado06PROD_STATUS.Value:=102    //生产前暂缓
         else
          dm.ado06PROD_STATUS.Value:=103;  //生产中暂缓
         dm.ado06.Post;
         dm.ado06.Next;
        end;
     rkey60 := dm.ADOQuery1D60RKEY.Value;
     dm.ADOQuery1.Close;
     dm.ADOQuery6.Close;
     dm.ADOQuery1.Open;
     dm.ADOQuery6.Open;
     dm.ADOQuery1.Locate('d60rkey',rkey60,[]);
    end;

   finally
    edit_note.free;
   end;

end;

procedure TForm1.N14Click(Sender: TObject);
var
 rkey60:integer;
 status:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 if messagedlg('您确认要从结案中重新起动此销售订单吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   status:=dm.ADOQuery1status.Value;
   dm.ADOQuery1.Edit;
   dm.ADOQuery1D60STATUS.Value := 1;
   dm.ADOQuery1.Post;
   with dm.ADOQuery5 do
   begin
    close;                  //记录销售订单数量更改情况(日志文件)               `
    sql.Clear;
    sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.ADOQuery1D60RKEY.AsString+',11,''手工将销售订单从结案中重新起动'',');
    sql.Add(''''+status+''','''+dm.ADOQuery1status.AsString+''','+rkey73+',');
    sql.add('getdate(),32)');
    ExecSQL;
   end;
   rkey60 := dm.ADOQuery1d60rkey.Value;
   dm.ADOQuery1.Close;
   dm.ADOQuery6.Close;
   dm.ADOQuery1.Open;
   dm.ADOQuery6.Open;
   dm.ADOQuery1.Locate('d60rkey',rkey60,[]);
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.ADOQuery1D60RKEY.Value;
 dm.ADOQuery1.Close;
 dm.ADOQuery6.Close;
 dm.ADOQuery1.Open;
 dm.ADOQuery6.Open;
 if rkey>0 then dm.ADOQuery1.Locate('d60rkey',rkey,[]);
end;

procedure TForm1.N15Click(Sender: TObject);
begin
form13:=tform13.Create(application);
form13.dtpk1.Date:=dm.adoquery1.Parameters.ParamValues['dtpk1'];
form13.dtpk2.Date:=dm.adoquery1.Parameters.ParamValues['dtpk2']-1;
if not dm.ADOQuery1.IsEmpty then
 form13.Edit1.Text := dm.ADOQuery1D60SALES_ORDER.Value;
form13.ShowModal;
form13.Free;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
checkvar
end;


procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.adoquery1.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.adoquery1.filter := '';
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
if (column.FieldName <> dm.adoquery1.IndexFieldNames) and
   (column.FieldName <> 'status') and
   (column.FieldName <> 'quote_auth') and
   (column.FieldName <> 'Prod_rel') then
 dm.adoquery1.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label4.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
 end
else
 edit1.SetFocus;
 
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid1,self.Caption);
end;

procedure TForm1.BtFldsClick(Sender: TObject);
begin
PMFlds.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
PopupMenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
try
form_report:= Tform_report.Create(application);
form_report.ppReport1.Reset;
form_report.ppReport1.Template.FileName :=
  stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'sales_order.rtm';
form_report.ppReport1.Template.LoadFromFile;
form_report.ppReport1.SaveAsTemplate:=true;
form_report.ppdesigner1.ShowModal;
finally
form_report.Free;
end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
try
  form13:= Tform13.Create(application);
  form13.ppReport1.Reset;
  form13.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'much_Asoreport.rtm';
  form13.ppReport1.Template.LoadFromFile;
  form13.ppReport1.SaveAsTemplate:=true;
  form13.ppdesigner1.ShowModal;
finally
  form13.Free;
end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  end
  else
  try
    frmViewCredit:= TfrmViewCredit.Create(Application);
    frmViewCredit.prev:= strtoint(vprev);
    frmViewCredit.ShowModal;
  finally
    frmViewCredit.free;
  end;


end;

procedure TForm1.N21Click(Sender: TObject);
begin
  frmSCPOrpt:=TfrmSCPOrpt.Create(application);
  try
    frmSCPOrpt.dtpk1.Date:=dm.adoquery1.Parameters.ParamValues['dtpk1'];
    frmSCPOrpt.dtpk2.Date:=dm.adoquery1.Parameters.ParamValues['dtpk2']-1;
    if not dm.ADOQuery1.IsEmpty then
    begin
//     frmSCPOrpt.Edit1.Text := dm.ADOQuery1D60SALES_ORDER.Value;
     frmSCPOrpt.Edit3.Text := dm.ADOQuery1D97PO_NUMBER.Value;
     frmSCPOrpt.Edit11.Text:= dm.ADOQuery1code.Value;
     frmSCPOrpt.label85.Caption:= dm.ADOQuery1ABBR_NAME.Value;
    end;
    frmSCPOrpt.ShowModal;
  finally
    frmSCPOrpt.Free;
  end;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
  try
    frmSCPOrpt:= TfrmSCPOrpt.Create(application);
    frmSCPOrpt.ppReport1.Reset;
    frmSCPOrpt.ppReport1.Template.FileName :=
        stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
          'SCPurPOrpt.rtm';
    frmSCPOrpt.ppReport1.Template.LoadFromFile;
    frmSCPOrpt.ppReport1.SaveAsTemplate:=true;
    frmSCPOrpt.ppdesigner1.ShowModal;
  finally
    frmSCPOrpt.Free;
  end;
end;

procedure TForm1.N27Click(Sender: TObject);
var
  f:string;
  fs: TMemoryStream;
begin
   with dm.aqTmp do
   begin
     close;
     sql.Clear;
     sql.Add('SELECT file_content,filename FROM Data0097 WHERE (file_content is not null) and RKEY =  '+dm.ADOQuery1.FieldByName('PURCHASE_ORDER_PTR').AsString);
     open;
   end;
  if dm.aqTmp.RecordCount=0 then
  begin
    ShowMessage('文档未上传');
    Abort;
  end;
  fs := TMemoryStream.Create;
  TBlobfield(dm.aqTmp.fieldbyname('file_content')).SaveToStream(fs);
  UnPackStream(fs);
  if not DirectoryExists(TmpFileDir) then
    if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
  f:=TmpFileDir+dm.aqTmp.fieldbyname('filename').AsString;
  fs.SaveToFile(f);
  fs.Free;
  ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);   
end;

procedure TForm1.PMFldsPopup(Sender: TObject);
begin
  if (strtoint(vprev) <= 3)  then
   begin
   (sender as TPopupmenu).Items[9].Enabled:=false;
   (sender as TPopupmenu).Items[11].Enabled:=false;
   end;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var i:Integer;
begin
  if not dm.ADOQuery1.IsEmpty then
  begin
    i:=1;
    dm.ADOQuery1.DisableControls;
    dm.ADOQuery1.First;
    while not dm.ADOQuery1.Eof do
    begin
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
      StringGrid1.Cells[0,i]:=dm.ADOQuery1.FieldByName('MANU_PART_DESC').AsString;
      StringGrid1.Cells[1,i]:=dm.ADOQuery1.FieldByName('D97PO_NUMBER').AsString;
      StringGrid1.Cells[2,i]:=dm.ADOQuery1.FieldByName('ANALYSIS_CODE_2').AsString;
      StringGrid1.Cells[3,i]:=dm.ADOQuery1.FieldByName('PARTS_ORDERED').AsString;
      StringGrid1.Cells[4,i]:=dm.ADOQuery1.FieldByName('ENT_DATE').AsString;
      StringGrid1.Cells[5,i]:=dm.ADOQuery1.FieldByName('D60SALES_ORDER').AsString;
      dm.ADOQuery1.Next;
      i:=i+1;
    end;
    dm.ADOQuery1.EnableControls;
    Export_Grid_to_Excel(StringGrid1,Self.Caption,False);
  end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end
 else
 begin
  ExcelToDB;
  BitBtn3Click(Sender);
 end;
end;

procedure TForm1.ExcelToDB;
var
  fileName:String;
  iCount, jCount,i: Integer;
  XLApp: variant;
  Sheet: Variant;
  AdoCon:TADOConnection;
  AdoTmps,AdoTmp:TADOQuery;
  Rkey25,Rkey23,Rkey15,rkey04,rkey97:string;
  exch_rate:Double;
  tax_2:Currency;
  dDate:TDateTime;
 v_seed,v_last,new_seed,invoice:string;
 v_length,control_no:byte;
begin
  if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  try
   XLApp := CreateOleObject('Excel.Application');
  except
   Screen.Cursor := crDefault;
   Exit;
  end;
  dDate:=getsystem_date(dm.aqTmp,0);
  AdoTmps:=TADOQuery.Create(Application);
  AdoTmp:=TADOQuery.Create(Application);
  AdoCon:=TADOConnection.Create(Application);
  AdoCon.ConnectionString:='Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb;Data Source=172.18.0.8';
  AdoCon.LoginPrompt:=False;
  AdoCon.Connected:=True;
  AdoTmps.Connection:=AdoCon;
  AdoTmp.Connection:=dm.ADOConnection1;
   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     DM.ADOQuery1.DisableControls;
     for iCount:=2 to 65535 do
     begin
       if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,6]) = '') then Break;
       if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,7]) = '') then
       begin
         ShowMessage('存在销售单对应的本厂编号未填写情况，请检查');
         exit;
       end;
       if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,8]) = '') then
       begin
         ShowMessage('存在销售单对应的客户代码未填写情况，请检查');
         exit;
       end;
       if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,9]) = '') then
       begin
         ShowMessage('存在销售单对应的外发指定供应商未填写情况，请检查');
         exit;
       end;
       if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,10]) = '') then
       begin
         ShowMessage('存在销售单对应的工厂未填写情况，请检查');
         exit;
       end;
     end;
     for iCount:=2 to 65535 do
     begin
       if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,6]) = '') then Break;
       dm.qrytmp.Close;
       dm.qrytmp.SQL.Clear;
       dm.qrytmp.SQL.Text:='select * from data0097 where PO_NUMBER ='''+trim(XLApp.workbooks[1].sheets[1].cells[iCount,2])+''' ';
       dm.qrytmp.Open;
       if dm.qrytmp.IsEmpty then
       begin
         MessageDlg('第'+inttostr(iCount)+'行客户订单号在系统中不存在或状态不可用,请确定客户订单号是否正确!',mtInformation,[mbok],1);
         Exit;
       end;
       Rkey97:=dm.qrytmp.FieldByName('Rkey').AsString;
       AdoTmps.Close;
       AdoTmps.SQL.Clear;
       AdoTmps.SQL.Text:='select data0060.*,data0005.EMPLOYEE_NAME from data0060 inner join data0005 '
       +'on data0060.COMM_ASSIGNED_BY_E_P=data0005.rkey where SALES_ORDER='''+Trim(XLApp.workbooks[1].sheets[1].cells[iCount,6])+'''';
       AdoTmps.Open;
       if AdoTmps.IsEmpty then
       begin
         MessageDlg('第'+inttostr(iCount)+'行销售订单在导出系统中不存在,请确定销售订单是否存在!',mtInformation,[mbok],1);
         Exit;
       end;
       dm.qrytmp.Close;
       dm.qrytmp.SQL.Clear;
       dm.qrytmp.SQL.Text:='select Rkey from data0025 where MANU_PART_NUMBER='''+trim(XLApp.workbooks[1].sheets[1].cells[iCount,7])+'''';
       dm.qrytmp.Open;
       if dm.qrytmp.IsEmpty then
       begin
         MessageDlg('第'+inttostr(iCount)+'行本厂编号在系统中不存在,请确定本厂编号是否已建立好!',mtInformation,[mbok],1);
         Continue;
       end;
       Rkey25:=dm.qrytmp.FieldByName('Rkey').AsString;
       AdoTmp.Close;
       AdoTmp.SQL.Clear;
       AdoTmp.SQL.Text:='select data0010.Rkey,data0012.RKey,data0010.CURRENCY_PTR,data0010.CONTACT_NAME_1,data0001.exch_rate,'
       +'data0012.rkey as Rkey12,data0012.LOCATION,data0012.ship_to_contact,data0012.ship_shipping_method,data0012.ship_to_phone,data0012.SHIP_FOB from data0010 '
       +' inner join data0012 on data0010.Rkey=data0012.CUSTOMER_PTR inner join data0001 on data0010.CURRENCY_PTR=data0001.Rkey '
       +' where data0010.CUST_CODE='''+trim(XLApp.workbooks[1].sheets[1].cells[iCount,8])+''' and data0010.CUSTOMER_TYPE<>4';
       AdoTmp.Open;
       if AdoTmp.IsEmpty then
       begin
         MessageDlg('第'+inttostr(iCount)+'行客户代码在系统中不存在,请确定客户代码是否正确!',mtInformation,[mbok],1);
         Continue;
       end;
       dm.qrytmp.Close;
       dm.qrytmp.SQL.Clear;
       dm.qrytmp.SQL.Text:='select Rkey,TAX_2 from data0023 where CODE='''+trim(XLApp.workbooks[1].sheets[1].cells[iCount,9])+'''';
//       dm.qrytmp.SQL.Text:='select Rkey,TAX_2 from data0023 where CODE='''+trim(XLApp.workbooks[1].sheets[1].cells[iCount,9])+''' and ttype<>0 and status=0';
       dm.qrytmp.Open;
       if dm.qrytmp.IsEmpty then
       begin
         MessageDlg('第'+inttostr(iCount)+'行供应商代码在系统中不存在或状态不可用,请确定外发供应商代码是否正确!',mtInformation,[mbok],1);
         Continue;
       end;
       Rkey23:=dm.qrytmp.FieldByName('Rkey').AsString;
       TAX_2:=dm.qrytmp.FieldByName('TAX_2').Value;
       dm.qrytmp.Close;
       dm.qrytmp.SQL.Clear;
       dm.qrytmp.SQL.Text:='select Rkey from data0015 where WAREHOUSE_CODE='''+trim(XLApp.workbooks[1].sheets[1].cells[iCount,10])+''' ';
       dm.qrytmp.Open;
       if dm.qrytmp.IsEmpty then
       begin
         MessageDlg('第'+inttostr(iCount)+'行工厂在系统中不存在或状态不可用,请确定工厂代码是否正确!',mtInformation,[mbok],1);
         Continue;
       end;
       Rkey15:=dm.qrytmp.FieldByName('Rkey').AsString;
      //============================ 启动事物处理=====================================
       if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
     //*****************************************开始更新data0060及它的子表
       with dm.ADOQuery3 do
       begin
        if active=true then active:=false;
        sql.Clear;
        sql.Add('select * from data0060 where Rkey is NULL');
        active:=true;
          append;
          fieldbyname('ship_reg_tax_id').AsString := Rkey15;        //工厂指针
          fieldbyname('customer_ptr').AsString := AdoTmp.FieldByName('Rkey').AsString;        //客户指针
          fieldbyname('cust_part_ptr').AsString := Rkey25;       //产品型号指针
          fieldbyname('purchase_order_ptr').AsString :=Rkey97;  //采购定单指针
          fieldbyname('CUST_SHIP_ADDR_PTR').AsString :=AdoTmp.FieldByName('Rkey12').AsString;  //装运地址指针
          fieldbyname('CURRENCY_PTR').AsString :=AdoTmp.FieldByName('CURRENCY_PTR').AsString;        //货币批针
          fieldbyname('CUSTOMER_CONTACT').AsString :=AdoTmp.FieldByName('CONTACT_NAME_1').AsString;        //客户联络人
          fieldbyname('EXCH_RATE').AsString :=AdoTmps.fieldbyname('EXCH_RATE').AsString;                   //汇率
          fieldbyname('SHIPPING_CONTACT').AsString := AdoTmp.FieldBYName('ship_to_contact').AsString;           //装运联络人
          fieldbyname('SHIP_CONTACT_PHONE').AsString := AdoTmp.FieldBYName('ship_to_phone').AsString;         //装运联络人电话
          fieldbyname('SHIPPING_METHOD').AsString :=AdoTmp.FieldBYName('ship_shipping_method').AsString;            //装运方法
          fieldbyname('FOB').AsString := AdoTmp.FieldBYName('ship_fob').AsString;                         //离岸价格
          fieldbyname('COD_FLAG').AsString :=AdoTmps.fieldbyname('COD_FLAG').AsString;               //货到收款
          fieldbyname('reg_tax_fixed_unused').AsString := '0';   //赶工费用计算方法
          fieldbyname('CSI_USER_PTR').AsString := rkey73;      //系统用户指针
          fieldbyname('ENTERED_BY_EMPL_PTR').AsString := user_ptr; //输入人员指针
          fieldbyname('comm_assigned_by_e_p').AsString := user_ptr;//拥金指派人员
          fieldbyname('rush_charge_pct_used').AsString :=AdoTmps.fieldbyname('rush_charge_pct_used').AsString;//交货期与生产完工日期差额
          fieldbyname('so_style').AsInteger :=AdoTmps.fieldbyname('so_style').AsInteger;        //订单类别
          fieldvalues['so_tp'] := 1;                  //加工形式1外发
          fieldbyname('SO_OLDNEW').AsString :=AdoTmps.fieldbyname('SO_OLDNEW').AsString;     //订单新旧
          fieldbyname('RUSH_CHARGE').AsString :=AdoTmps.fieldbyname('RUSH_CHARGE').AsString;     //增值税%;
          dm.qrytmp.Close;
          dm.qrytmp.SQL.Clear;
          dm.qrytmp.SQL.Text:='select D5_2.Rkey from data0005 D5_1 inner join data0005 as D5_2 '
          +'on D5_1.EMPLOYEE_NAME=D5_2.EMPLOYEE_NAME where D5_1.EMPLOYEE_NAME='''+Trim(AdoTmps.fieldbyname('EMPLOYEE_NAME').AsString)+'''';
          dm.qrytmp.Open;
          fieldbyname('COMM_ASSIGNED_BY_E_P').AsString :=dm.qrytmp.FieldBYName('Rkey').AsString;   //业务员
          Fieldvalues['SUPPLIER_PTR']:=rkey23;  //外发指定供应商
          Fieldvalues['TAX_2']:=tax_2;  //外发供应商入库成本折率
          fieldbyname('STATE_PROD_TAX_FLAG').AsString :=AdoTmps.fieldbyname('STATE_PROD_TAX_FLAG').AsString;

           fieldbyname('STATE_TOOL_TAX_FLAG').AsString :=AdoTmps.fieldbyname('STATE_TOOL_TAX_FLAG').AsString;      //是否对工具费用征税

           fieldbyname('COMMISION_ON_TOOLING').AsString :=AdoTmps.fieldbyname('COMMISION_ON_TOOLING').AsString;      //订单是否转厂

           fieldbyname('TAX_IN_PRICE').AsString:=AdoTmps.fieldbyname('TAX_IN_PRICE').AsString;               //价格是否含税

         dm.qrytmp.Close;
         dm.qrytmp.SQL.Clear;
         dm.qrytmp.SQL.Text:='select SEED_VALUE from data0004 where table_name=''data0060''';
         dm.qrytmp.Open;
         Rkey04:=dm.qrytmp.FieldByName('SEED_VALUE').AsString+'-01';
          fieldbyname('SALES_ORDER').AsString := Rkey04;     //销售定单;
          fieldbyname('PARTS_ORDERED').AsString :=AdoTmps.fieldbyname('PARTS_ORDERED').AsString;   //数量;
          FieldByName('to_be_planned').asstring :=AdoTmps.FieldByName('to_be_planned').asstring;   //用作计划
          FieldByName('to_be_confirmed').asstring := AdoTmps.FieldByName('to_be_confirmed').asstring; //用作确认
          fieldbyname('PART_PRICE').AsString :=formatfloat('0.00000000',AdoTmps.fieldbyname('PART_PRICE').Value/0.95);      //价格;
          fieldbyname('REFERENCE_NUMBER').AsString :=AdoTmps.fieldbyname('REFERENCE_NUMBER').AsString;      //参考附注
          fieldbyname('DISCOUNT').AsString := '0';        //折扣%;
          fieldbyname('P_CODE').AsString :=AdoTmps.fieldbyname('P_CODE').AsString;          //优先;
          fieldbyname('ORIG_REQUEST_DATE').AsString :=AdoTmps.fieldbyname('ORIG_REQUEST_DATE').AsString;  //客户交期
          fieldbyname('ORIG_SCHED_SHIP_DATE').AsString :=AdoTmps.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString;//计划交期
          fieldbyname('DUE_DATE').AsString :=AdoTmps.fieldbyname('DUE_DATE').AsString;         //原始客户交期
          fieldbyname('CONSUME_FORECASTS').AsString := '0';    //预测耗费
          fieldbyname('BACKWARD_DAYS').AsString := '0';        //向后天数
          fieldbyname('FORWARD_DAYS').AsString := '0';         //向前天数
          fieldbyname('ANALYSIS_CODE_1').AsString := AdoTmps.fieldbyname('ANALYSIS_CODE_1').AsString;
          fieldbyname('ANALYSIS_CODE_2').AsString := AdoTmps.fieldbyname('ANALYSIS_CODE_2').AsString;
          fieldbyname('ANALYSIS_CODE_3').AsString := AdoTmps.fieldbyname('ANALYSIS_CODE_3').AsString;
          fieldbyname('ANALYSIS_CODE_4').AsString := AdoTmps.fieldbyname('ANALYSIS_CODE_4').AsString;
          fieldbyname('ANALYSIS_CODE_5').AsString := AdoTmps.fieldbyname('ANALYSIS_CODE_5').AsString;
          fieldbyname('set_ordered').AsString := AdoTmps.fieldbyname('set_ordered').AsString;
          fieldbyname('set_price').AsString := AdoTmps.fieldbyname('set_price').AsString;
          fieldbyname('TOTAL_ADD_L_PRICE').AsString := AdoTmps.fieldbyname('TOTAL_ADD_L_PRICE').AsString;    //工具费用总计
          fieldbyname('ent_date').AsString:=FormatDateTime('yyyy-MM-dd HH:mm:ss',dDate);//输入日期 系统服务器时间
          Fieldvalues['status']:=1;      //状态为未提交(040207修改)
          Fieldvalues['prod_rel']:='2';  //生产发放标记已确认的
          FieldByName('parts_alloc').AsString :=formatfloat('0.00000000',AdoTmps.FieldByName('parts_alloc').Value/0.95); //不含税价格

          fieldvalues['quote_price']:=3;      //表示so不审批
          fieldbyname('RemarkSO').asstring:=AdoTmps.fieldbyname('RemarkSO').asstring; //销售订单记事本
          fieldvalues['RemarkAudit']:=AdoTmps.fieldvalues['RemarkAudit']; //评审记事本
//          fieldbyname('ORIG_CUSTOMER').asstring:=AdoTmps.fieldbyname('ORIG_CUSTOMER').asstring;
          try
           post;
          except
//           on E: Exception do
//            begin
              dm.ADOConnection1.RollbackTrans;
//              messagedlg(E.Message,mterror,[mbcancel],0);
//              exit;
//            end;
           messagedlg('数据保存失败,可能是有其它用户同时操作而且在你之前提交,请稍后再试!',mtwarning,[mbok],0);
           exit;
          end;

         dm.Ado04.Close;
         dm.Ado04.Open;
         v_seed := trim(dm.Ado04.FieldValues['seed_value']);
         v_length := length(trim(dm.Ado04.FieldValues['seed_value'])); //现有长度
         control_no := dm.Ado04CONTROL_NO_LENGTH.Value;  //控制最大长度
         for i := v_length downto 1 do         //更新data0004
         if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
          begin                               //后缀加1
           v_last := floattostr(100000000+strtofloat(copy(v_seed,i+1,v_length-i))+1);
           new_seed := copy(v_seed,1,i)+copy(v_last,control_no-(v_length-i)+1,v_length-i);
           dm.Ado04.Edit;            //使前缀不变后缀加1
           dm.Ado04.FieldValues['seed_value'] := new_seed;
           dm.Ado04.Post;
           break;
          end
         else
          if i=1 then //如果第一位仍然是数字
           begin
            v_last := floattostr(1000000000+strtofloat(v_seed)+1);
            new_seed := copy(v_last,control_no+1-v_length+1,v_length);
            dm.Ado04.Edit;
            dm.Ado04.FieldValues['seed_value'] := new_seed;
            dm.Ado04.Post;
           end;

//          dm.aQ62.Append;
//          dm.aQ62.Fieldvalues['so_ptr'] := stringgrid1.RowCount-1;
//          dm.aQ62.FieldByName('addl_cat_ptr').asstring := form3.StringGrid1.Cells[5,i];
//          dm.AQ62.FieldByName('amount').asstring := form3.StringGrid1.Cells[1,i];
//          dm.AQ62.FieldByName('free_amount').asstring := form3.StringGrid1.Cells[2,i];
//          dm.AQ62.FieldByName('costfree_amount').asstring := form3.StringGrid1.Cells[3,i];
//          dm.AQ62TAX_FLAG.Value:=form3.StringGrid1.Cells[4,i];
//          dm.AQ62.post;
//          dm.ADO360.Close;
//          dm.ADO360.Parameters[0].Value:=fieldvalues['rkey'];
//          dm.ADO360.Open;
//          dm.ADO360.Append;
//          dm.ADO360so_ptr.Value:=fieldvalues['rkey'];
//          dm.ADO360quantity.Value:=fieldvalues['PARTS_ORDERED'];
//          dm.ADO360sch_date.Value:=fieldvalues['ORIG_SCHED_SHIP_DATE'];
//          dm.ADO360.Post;
          try
            dm.ADOConnection1.CommitTrans;   //事物提交
            dm.ADOQuery6.Close;
            dm.ADOQuery6.Open;
          except
            dm.ADOConnection1.RollbackTrans;
            messagedlg('数据保存失败,请速与管理员联系!',mtwarning,[mbok],0);
          end;
       end;
     end;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
     DM.ADOQuery1.EnableControls;
     AdoCon.Connected:=False;
     AdoCon.Free;
     AdoTmps.Connection:=nil;
     AdoTmps.Close;
     AdoTmps.Free;
     AdoTmp.Connection:=nil;
     AdoTmp.Close;
     AdoTmp.Free;
   end
end;

end.

