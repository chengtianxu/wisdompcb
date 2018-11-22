unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, DBGridEh, DBGrids, Menus,Excel2000,
  ComObj,math, DB, ComCtrls, DBClient;

type
  TfrmMain = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PopupMenu2: TPopupMenu;
    db_ptr: TLabel;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton5: TSpeedButton;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    SpeedButton3: TSpeedButton;
    Label6: TLabel;
    Edit4: TEdit;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel4: TPanel;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    BitBtn3: TBitBtn;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGridEh2: TDBGridEh;
    btnColumn: TBitBtn;
    pmColumn: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure btnColumnClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    _SQL,_FN:string;
    _DDSQL,_KHSQL,_SOTPSQL,_TTYPSQL:string;//分析图SQL语句

    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
    procedure item_click(sender:TObject);
    function checkchar(const pstr:string;const pkey:char):boolean;
 //   procedure SetGridColumns;
  public
    _Dt1:Tdate;
    _Dt2:Tdate;
  end;

var
  frmMain: TfrmMain;

implementation

uses uCondition, Report1, uDM, Report2, Report3, uTotalChart,common,
  form_SetField;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.Conn) then
  begin
   showmsg('程序起动失败请联系管理员!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 { dm.Conn.Close;
  dm.Conn.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=wisdompcb;Data Source=192.168.1.252';
  dm.Conn.Open;
  
  vprev:='4';
 user_ptr:='1';
 rkey73:='1';  }


  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  
end;



function TfrmMain.checkchar(const pstr:string;const pkey:char):boolean;
begin
  result:=true;
if not (pkey in ['0'..'9','.',#8]) then  //判断是否输入数字
  begin
    result:=false
  end
 else
  if pkey = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',pstr)>0  then
      begin
        result:=false;
      end
   else
      result:=true;
end;
//增删字段
procedure TFrmMain.item_click(sender:TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.Columns.Count-1  do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to DBGridEh1.Columns.Count-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;
procedure TFrmMain.NewGridWnd(var Message: TMessage);
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

procedure TfrmMain.FormShow(Sender: TObject);
var i:integer;
    item:TmenuItem;
begin
  if dm.Conn.Connected then
  begin
   { 彭华于２０１４０４０９号注释掉，因不在使用这种方法控制表格列的显示。
    for i:=0 to DBGridEh1.Columns.Count-1 do
    begin
      item:=TmenuItem.Create(self);
      item.Caption:=DBGridEh1.Columns[i].Title.Caption;
      if DBGridEh1.Columns[i].Visible then
        item.Checked:=true
      else
        if strtoint(vprev) < 3 then
          item.Enabled:=false
        else
         item.Enabled:=true;

      case i of
        8:item.Enabled:=True; //显示确认
        9:item.Enabled:=True; //显示确认
       11:item.Enabled:=True; //显示客户交期
       32:item.Enabled:=True;   //允许显示订单提交
       34:item.Enabled:=True;   //允许显示订单库存
       44:item.Enabled:=True;   //显示送货地点
      end;

      item.OnClick:=item_click;
      PopupMenu2.Items.Add(item);
    end;}
    _Dt1:=date()-30;
    _Dt2:=date();
    DateTimePicker1.Date:=date();
    DateTimePicker2.Date:=date();
    _SQL:=dm.DS60.CommandText ;
    if (strtoint(vprev) = 1) or (strtoint(vprev) = 3) then
      _SQL:=_SQL+
      ' WHERE DATA0010.rkey in (SELECT customer_ptr from DATA0100 WHERE csi_ptr='+rkey73+') '
    else
      _SQL:=_SQL+' where 1=1 ';

    if strtoint(vprev) < 3 then
      dm.DS62.Close
    else
      if dm.DS62.Active =false then dm.DS62.Open ;
    _SOTPSQL:=DM.AQrySOTP.SQL.Text;
    _KHSQL:=DM.AQryKH.SQL.Text;
    _TTYPSQL:=dm.AQryTTYP.SQL.Text;
    _DDSQL:=dm.AQryDD.SQL.Text;
    Application.CreateForm(TfrmCondition, frmCondition);
    frmCondition.DTPk5.Date:=_Dt1;
    frmCondition.DTPk6.Date:=_Dt2;
    frmCondition.DateTimePicker1.Date:=_Dt1;
    frmCondition.DateTimePicker2.Date:=_Dt2;
    SpeedButton2Click(sender);//显示条件窗口
  end;

  {以下代码完成不允许查看的字段设置，}
  SetLength(NoPermissionSeeField_Info,1);
  NoPermissionSeeField_Info[0]:=TNoPermissionSeeFieldInfo.Create();
  with NoPermissionSeeField_Info[0] do
  begin
    L_GridName:=DBGridEh1;             //货币      汇率         价格         税率(%)
    L_NoPermissionFields:=vararrayOf(['curr_code','exch_rate','part_price','RUSH_CHARGE','ofree', 
    'fed_tax_id_no','total_add_l_price','free_amount','freeamount','TNUMBER','rate_margin','stand_rate','TaxAmount','NoTaxAmount']);
  end;
  setGridColumns(Self,DM.cds0849,DM.Conn,( StrToInt(vprev) in [3,4])=False);   //设置表格列是否显示。
end;

procedure TfrmMain.SpeedButton2Click(Sender: TObject); //查询
begin
 frmCondition.PageControl1.ActivePageIndex:=0;
 frmCondition.DTPk5.Date:=_Dt1;
 frmCondition.DTPk6.Date:=_Dt2;
 if frmCondition.ShowModal()<>mrok then exit;
 dm.DS60.Close;
 dm.DS60.CommandText:=_SQL;
 dm.DS60.CommandText:=dm.DS60.CommandText+frmCondition._SearchStr;
 //ShowMessage(DM.DS60.CommandText);
 dm.DS60.Prepared;
 dm.DS60.Open ;
 if frmCondition.RadioGroup5.ItemIndex =0 then
 begin
  DBGridEh1.OptionsEh:=[dghMultiSortMarking];
  CheckBox1.Checked :=true;
 end;
 dm.DS60.Sort:=frmCondition._SortStr;
 _Dt1:=frmCondition.DTPk5.Date;
 _Dt2:=frmCondition.DTPk6.Date;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject); //导出EXCEL
begin
 if dm.DS60.Active=false then exit;
 if dm.DS60.RecordCount=0 then exit;
 Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

procedure TfrmMain.SpeedButton4Click(Sender: TObject);
begin
 PopupMenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.SpeedButton3Click(Sender: TObject);
begin                     //DM.Conn ,
  ResetColumns(Self,DM.cds0849,DBGridEh1,StrToInt(rkey73));
 // 增加一个数组参数，不能修改的字段，即银码字段。
  //PopupMenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
 frmCondition.Free ;
 CLOSE;
end;

procedure TfrmMain.N4Click(Sender: TObject);   //显示，隐藏列
begin
  (sender as tmenuitem).Checked:=not (sender as tmenuitem).Checked;
  dbgrideh1.Columns[(sender as tmenuitem).MenuIndex ].Visible :=(sender as tmenuitem).Checked;
end;

procedure TfrmMain.Edit4Change(Sender: TObject);  //固定行数
begin
  try
    dbgrideh1.FrozenCols := strtoint(edit4.Text);
  except
    showmessage('请录入有效的数字！');
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);  //打印,格式1
begin
  Application.CreateForm(TFrmReport1, FrmReport1);
  if (dm.DS60.Active = false) or (dm.DS60.RecordCount=0) then exit;
  FrmReport1.Query60.Close;
  FrmReport1.Query60.SQL.Text:=dm.DS60.CommandText;
//  FrmReport1.Query60.Parameters.ParamByName('rkey73').Value:=rkey73;
  FrmReport1.Query60.Open ;
  FrmReport1.Query60.Filter:=dm.DS60.Filter;
  FrmReport1.Query60.Sort:=dm.DS60.sort;
  FrmReport1.ppReport1.Reset;
  FrmReport1.ppReport1.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'MKT_RPT_01.rtm';
  FrmReport1.ppReport1.Template.LoadFromFile;
  FrmReport1.ppReport1.SaveAsTemplate:= False;
  FrmReport1.ppReport1.Print ;
  FrmReport1.Free ;
end;

procedure TfrmMain.N2Click(Sender: TObject);  //打印,格式2,格式3
begin
  Application.CreateForm(TFrmReport2, FrmReport2);
  FrmReport2.ppReport1.Reset;
  FrmReport2.ppReport1.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'MKT_RPT_02.rtm';
  FrmReport2.ppReport1.Template.LoadFromFile;
  FrmReport2.ppReport1.SaveAsTemplate:= False;
  FrmReport2.ppReport1.Print ;
  FrmReport2.Free ;
end;

procedure TfrmMain.N3Click(Sender: TObject);  //打印,格式3
begin
  Application.CreateForm(TFrmReport3, FrmReport3);
  FrmReport3.ppReport1.Reset;
  FrmReport3.ppReport1.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'MKT_RPT_01.rtm';
  FrmReport3.ppReport1.Template.LoadFromFile;
  FrmReport3.ppReport1.SaveAsTemplate:= False;
  FrmReport3.ppReport1.Print ;
  FrmReport3.Free ;
end;

procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
var i:integer;
    s:string;
begin
 if not DM.DS60.Active then exit;
 if (Column.FieldName='cstatus') OR (Column.FieldName='audited') then exit;

  if column.Title.SortMarker = smDownEh then
   column.Title.SortMarker := smUpEh
  else
   column.Title.SortMarker := smDownEh;

 s :='';
 if checkbox1.Checked then                 //组合排序
 begin
  for i := 0 to DBGridEh1.SortMarkedColumns.Count-1 do
   begin
    if i > 0 then s:=s+',';
     if DBGridEh1.SortMarkedColumns[i].Title.SortMarker = smUpEh then
      s := s + DBGridEh1.SortMarkedColumns[i].FieldName
     else
      s := s + DBGridEh1.SortMarkedColumns[i].FieldName+ ' DESC ';
   end;
  dm.DS60.Sort:=s;
 end
 
 else
  if column.Title.SortMarker =smDownEh then
   dm.DS60.Sort:=Column.FieldName+' DESC'
  else
   dm.DS60.Sort:=Column.FieldName;

 _FN:=Column.FieldName;  //查找
 label1.Caption:=column.Title.Caption+'：';
 case Column.Field.DataType  of
  ftautoinc,ftword,ftFloat:
   begin
    edit2.Visible:=true;
    DateTimePicker1.Visible :=not edit2.Visible;
    DateTimePicker2.Visible :=not edit2.Visible;
    label2.Visible:=not edit2.Visible;
    edit1.Visible:=not edit2.Visible;
   end;  
  ftDateTime:
   begin
    DateTimePicker1.Visible :=true;
    DateTimePicker2.Visible :=true;
    label2.Visible:=true;
    edit1.Visible :=not DateTimePicker1.Visible;
    edit2.Visible:=not DateTimePicker1.Visible;
   end;
 ftString:
  begin
   edit1.Visible :=true;
   edit2.Visible :=not edit1.Visible;
   DateTimePicker1.Visible:=not edit1.Visible;
   DateTimePicker2.Visible :=not edit1.Visible;
   label2.Visible:=not edit1.Visible;
  end;

 end;
 DateTimePicker1.Left :=edit1.Left;
 DateTimePicker1.Top:=edit1.Top;
 DateTimePicker2.Top:=edit1.Top;
 edit2.Top:=edit1.Top;
 edit2.Left :=edit1.Left ;
 edit1.Text:='';
 edit2.Text:='';  
end;

procedure TfrmMain.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
    dm.DS60.Filter :=_FN+' like ''%'+trim(edit1.text)+'%'''
  else dm.DS60.Filter :='';
end;

procedure TfrmMain.Edit2Change(Sender: TObject);
begin
  if trim(edit2.text)<>'' then
    dm.DS60.Filter :=_FN+' >='+trim(edit2.text)
  else dm.DS60.Filter :='';
end;



procedure TfrmMain.DateTimePicker1Change(Sender: TObject);
var vstr:string;
begin
  vstr:=_FN+' >= '+datetostr(DateTimePicker1.Date);
  vstr:=vstr+' and '+_FN+' <='+datetostr(DateTimePicker2.Date);
  dm.DS60.Filter :=vstr
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
 _FN:='cust_code';
  WindowState:= wsMaximized;
end;

procedure TfrmMain.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if  checkchar(TEdit(Sender).Text, key)=false then
    begin
      showmessage('请输入数字！！！');
      abort;
    end;
end;

procedure TfrmMain.CheckBox1Click(Sender: TObject); //联合排序
begin
 if CheckBox1.Checked then
  DBGridEh1.OptionsEh:=[dghMultiSortMarking]
 else
  DBGridEh1.OptionsEh:=[];
end;

procedure TfrmMain.SpeedButton5Click(Sender: TObject);  //统计分析
begin
 Application.CreateForm(TfrmTotalChart, frmTotalChart);
 frmTotalChart._SOTPSQL:=_SOTPSQL;
 frmTotalChart._TTYPSQL:=_TTYPSQL;
 frmTotalChart._DDSQL:=_DDSQL;
 frmTotalChart._KHSQL:=_KHSQL;
 frmTotalChart.ShowModal;
 frmTotalChart.Free;
end;

procedure TfrmMain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ds60.CommandText);
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
 PopupMenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.MenuItem1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport1, FrmReport1);
  FrmReport1.Query60.Close;
  FrmReport1.Query60.Open;
  FrmReport1.ppReport1.Reset;
  FrmReport1.ppReport1.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'MKT_RPT_01.rtm';
  FrmReport1.ppReport1.Template.LoadFromFile;
  FrmReport1.ppReport1.SaveAsTemplate:= True;
  FrmReport1.ppdesigner1.ShowModal;
  FrmReport1.Free ;
end;

procedure TfrmMain.MenuItem2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport2, FrmReport2);
  FrmReport2.ppReport1.Reset;
  FrmReport2.ppReport1.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'MKT_RPT_02.rtm';
  FrmReport2.ppReport1.Template.LoadFromFile;
  FrmReport2.ppReport1.SaveAsTemplate:= True;
  FrmReport2.ppDesigner1.ShowModal;
  FrmReport2.Free ;
end;

procedure TfrmMain.MenuItem3Click(Sender: TObject);
begin
  Application.CreateForm(TFrmReport3, FrmReport3);
  FrmReport3.ppReport1.Reset;
  FrmReport3.ppReport1.Template.FileName:= stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ 'MKT_RPT_01.rtm';
  FrmReport3.ppReport1.Template.LoadFromFile;
  FrmReport3.ppReport1.SaveAsTemplate:= True;
  FrmReport3.ppDesigner1.ShowModal;
  FrmReport3.Free ;
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
var
  i:Integer;
begin
  for i:=0 to High(NoPermissionSeeField_Info) do
  NoPermissionSeeField_Info[i].free;
end;

procedure TfrmMain.SpeedButton6Click(Sender: TObject);
begin
 frmCondition.PageControl1.ActivePageIndex:=1;
 frmCondition.DateTimePicker1.Date:=_Dt1;
 frmCondition.DateTimePicker2.Date:=_Dt2;
 if frmCondition.ShowModal()<>mrYes then exit;
// dm.DS60.Close;
// dm.DS60.CommandText:=_SQL;
// dm.DS60.CommandText:=dm.DS60.CommandText+frmCondition._SearchStr;
// //ShowMessage(DM.DS60.CommandText);
// dm.DS60.Prepared;
// dm.DS60.Open ;
// if frmCondition.RadioGroup5.ItemIndex =0 then
// begin
//  DBGridEh1.OptionsEh:=[dghMultiSortMarking];
//  CheckBox1.Checked :=true;
// end;
// dm.DS60.Sort:=frmCondition._SortStr;
 _Dt1:=frmCondition.DateTimePicker1.Date;
 _Dt2:=frmCondition.DateTimePicker2.Date;
end;

procedure TfrmMain.SpeedButton7Click(Sender: TObject);
begin
 if dm.aqTotal.Active=false then exit;
 if dm.aqTotal.RecordCount=0 then exit;
  Export_dbGridEH_to_Excel(DBGridEh2,self.Caption);
end;

procedure TfrmMain.btnColumnClick(Sender: TObject);
begin
  pmColumn.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  if DM.DS60.FieldByName('SampleYN').Value = 'Y' then
     DBGridEh1.Canvas.Font.Color := clRed; //cllime
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
