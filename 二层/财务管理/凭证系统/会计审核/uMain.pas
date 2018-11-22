unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask,
  DBCtrls, ExtCtrls, Excel2000,ClipBrd, Spin,ComObj;

type
  Tmain = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N10: TMenuItem;
    N9: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Splitter1: TSplitter;
    Label3: TLabel;
    Label6: TLabel;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    CheckBox10: TCheckBox;
    Panel1: TPanel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox3: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox6: TCheckBox;
    ComboBox1: TComboBox;
    Splitter2: TSplitter;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private

   OldGridWnd : TWndMethod;
   v_colwidth,v_colwidth1: array of integer;
   vWidth:integer;
   procedure NewGridWnd(var Message: TMessage);

    { Private declarations }
  public
    function SHUpdate():boolean;
    { Public declarations }
  end;

var
  main: Tmain;

implementation

uses uDM,DateUtils, AcctNote,math, voucher_report, uRpCons,common;

{$R *.dfm}
procedure Tmain.NewGridWnd(var Message: TMessage);
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

function Tmain.SHUpdate():boolean;  //审核更新
begin
 try
  if (pos('P',dm.ADOQ105voucher.AsString)>0) or
    (pos('R',dm.ADOQ105voucher.AsString)>0) then
    begin
      if dm.ADOQ105casher_ptr.AsVariant =null   then //出纳未审
        begin
          Result :=false;
          exit;
        end;
       if dm.ADOQ105audited_by_empl_ptr.AsVariant <>null then
         begin
           Result :=false;
           exit;
         end
    ELSE
      if dm.ADOQ105audited_by_empl_ptr.AsVariant <>null   then //
        begin
          Result :=false;
          exit;
        end;
    end;

    //本人录的凭证不能本人审核
  if dm.ADOQ105.FieldByName('ENTERED_BY_EMPL_PTR').asstring=trim(user_ptr) then
   begin
     Result :=false;
     exit;
   end;

  dm.ADOQ105.Edit;
  dm.ADOQ105status.Value:=1;
  dm.ADOQ105audited_by_empl_ptr.Value:=strtoint(user_ptr);
  dm.ADOQ105.Post;

  Result :=true;
 except
   messagedlg('数据提交失败，请稍后重新尝试！',mtinformation,[mbok],0);
   Result :=false;
 end;
end;

procedure Tmain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure Tmain.FormShow(Sender: TObject);
VAR
  i:integer;
begin
if  dm.ADOCnn.Connected then
 begin

  DM.ADOQ105.Close ;
  DM.ADOQ105.Open ;
  DM.ADODS106.Close ;
  DM.ADODS106.Open ;
  dm.ADOQ.close;
  dm.ADOQ.sql.text :='select * from data0508 ';
  dm.ADOQ.open;
  SpinEdit1.Value :=dm.ADOQ.Fieldbyname('CURR_FYEAR').Asinteger;
  SpinEdit2.Value :=dm.ADOQ.Fieldbyname('CURR_PERIOD').Asinteger;
  self.ComboBox1.ItemIndex :=combobox1.Items.Count -1;
  setlength(v_colwidth,dbgrid1.FieldCount);
  setlength(v_colwidth1,dbgrid2.FieldCount);
  for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid1.Columns[i].Width;
  for i:=0 to high(v_colwidth1) do v_colwidth1[i]:=dbgrid2.Columns[i].Width;

  //显示
  spinedit1.OnChange:=checkbox1click;
  spinedit2.OnChange:=checkbox1click;
  vWidth:=dbgrid1.Width;
  CheckBox1Click(sender);

 END;


end;

procedure Tmain.Edit1Change(Sender: TObject);
begin
  if trim(edit1.text)<>'' then
    dm.ADOQ105.Filter :='voucher like ''%'+trim(edit1.text)+'%'''
  else
    dm.ADOQ105.Filter :='';

end;
procedure Tmain.Edit2Change(Sender: TObject);
var
  msql:string;
begin
  if trim(edit2.text)<>'' then
    begin
      msql:= 'remark like ''%'+trim(edit2.text)+'%''';
      msql:=msql+' or entered like ''%'+trim(edit2.text)+'%''';
      msql:=msql+' or audited like ''%'+trim(edit2.text)+'%''';
      dm.ADOQ105.Filter :=msql;
    end
  else
    dm.ADOQ105.Filter :='';
end;

procedure Tmain.CheckBox1Click(Sender: TObject);
begin
 with DM.ADOQ105 do
  begin
   close;
   Parameters.ParamByName('vYear').Value :=SpinEdit1.Value;//年
   Parameters.ParamByName('vMonth').Value :=SpinEdit2.Value;//月份
   if not Checkbox1.Checked  then
     Parameters.ParamByName('vptr1').Value :=0
   else
     parameters.ParamByName('vptr1').Value :=9;
   if not Checkbox2.Checked  then
     parameters.ParamByName('vptr2').Value :=1
   else
     parameters.ParamByName('vptr2').Value :=9;
   if not Checkbox3.Checked  then
     parameters.ParamByName('vptr3').Value :=2
   else
     parameters.ParamByName('vptr3').Value :=9;
   if not Checkbox4.Checked  then
     parameters.ParamByName('vptr4').Value :=3
   else
     parameters.ParamByName('vptr4').Value :=9;

   if not Checkbox1.Checked  then                 //特殊转帐凭证
     Parameters.ParamByName('vptr5').Value :=4
   else
     parameters.ParamByName('vptr5').Value :=9;

   //凭证状态(审核)
   if not Checkbox5.Checked  then
     parameters.ParamByName('vstatus1').Value :=0
   else
     parameters.ParamByName('vstatus1').Value :=9;
   if not Checkbox6.Checked  then
     parameters.ParamByName('vstatus2').Value :=4
   else
     parameters.ParamByName('vstatus2').Value :=9;
   if not Checkbox7.Checked  then
     parameters.ParamByName('vstatus3').Value :=1
   else
     parameters.ParamByName('vstatus3').Value :=9;
   if not Checkbox8.Checked  then
     parameters.ParamByName('vstatus4').Value :=2
   else
     parameters.ParamByName('vstatus4').Value :=9;
   if not Checkbox9.Checked  then
     parameters.ParamByName('vstatus5').Value :=3
   else
     parameters.ParamByName('vstatus5').Value :=9;

   //业务类型

   if combobox1.ItemIndex<>combobox1.Items.Count-1 then  //不是最后一行
    begin
     sql.Delete(sql.Count-2);
     sql.Insert(sql.Count-1,'and TRANS_TYPE='+inttostr(combobox1.ItemIndex+1));
    end
   else
    begin
     sql.Delete(sql.Count-2);
     sql.Insert(sql.Count-1, '');
    end;
   open;

   self.Caption:=Application.Title+inttostr(RecordCount)+'张';

 end;

end;

//审核
procedure Tmain.N2Click(Sender: TObject);
var
  i:integer;
begin
  Screen.Cursor := crHourGlass;
  for i:=1 to DBGrid1.SelectedRows.Count do
    begin
      dm.ADOQ105.Bookmark :=DBGrid1.SelectedRows.Items[i-1];
      SHUpdate();
    end;
  Screen.Cursor := crDefault;
end;

//取消审核
procedure Tmain.N3Click(Sender: TObject);
var
  i:integer;
begin
 try
  Screen.Cursor := crHourGlass;
  for i:=1 to DBGrid1.SelectedRows.Count do
    begin
      dm.ADOQ105.Bookmark :=DBGrid1.SelectedRows.Items[i-1];

      if dm.ADOQ105.FieldByName('STATUS').asinteger<>1 then
        begin
         Continue;
        end;

       dm.ADOQ105.Edit;
       if (dm.ADOQ105VOU_TYPE.AsInteger=1) or
         (dm.ADOQ105vou_type.AsInteger =2) or
         (dm.ADOQ105vou_type.AsInteger =3) then

         dm.ADOQ105status.Value:=4
       else
         dm.ADOQ105status.Value:=0;

      dm.ADOQ105audited_by_empl_ptr.AsVariant:=null;
      dm.ADOQ105.Post;
    end;
   Screen.Cursor := crDefault;
 except
   messagedlg('数据提交失败，请稍后重新尝试！',mtinformation,[mbok],0);
   Screen.Cursor := crDefault;
 end;
end;


//退出
procedure Tmain.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure Tmain.N14Click(Sender: TObject);
begin
 close;
end;
//查询
procedure Tmain.N9Click(Sender: TObject);
begin
  Application.CreateForm(TFrmAcctNote, FrmAcctNote);
  FrmAcctNote.PopupMenu1.Free;
  FrmAcctNote.Edit6.text:=DM.ADOQ105.FieldByName('voucher').asstring;
  FrmAcctNote.datetimepicker1.DateTime :=DM.ADOQ105.fieldbyname('entered_dt').asdatetime;
  FrmAcctNote.datetimepicker1.Enabled :=false;
  FrmAcctNote.edit5.Text :=DM.ADOQ105.fieldbyname('attached').asstring;
  FrmAcctNote.edit15.Text :=DM.ADOQ105.fieldbyname('entered').asstring;
  FrmAcctNote.edit1.Text :=DM.ADOQ105.fieldbyname('FYEAR').AsString;
  FrmAcctNote.edit4.Text :=DM.ADOQ105.fieldbyname('PERIOD').AsString;
  FrmAcctNote.Label4.Caption:=DM.ADOQ105.fieldbyname('ctype').Value;

  DM.ADODS106.First;
  with DM.ADODS106 do
  while not eof do
  begin
    FrmAcctNote.stringgrid1.RowCount:=FrmAcctNote.stringgrid1.RowCount+1;
    FrmAcctNote.stringgrid1.Cells[0,FrmAcctNote.stringgrid1.RowCount-2]:=Fieldbyname('description').asstring;
    FrmAcctNote.stringgrid1.Cells[1,FrmAcctNote.stringgrid1.RowCount-2]:=trim(Fieldbyname('gl_acc_number').Value)+'-'+trim(Fieldbyname('Cgl_Acc').Value);

    FrmAcctNote.stringgrid1.Cells[2,FrmAcctNote.stringgrid1.RowCount-2]:=Fieldbyname('CURR_CODE').asstring;
    if dm.ADODS106EXCH_RATE.Value > 0 then
     FrmAcctNote.stringgrid1.Cells[3,FrmAcctNote.stringgrid1.RowCount-2]:=
      formatfloat('0.0000',1/Fieldbyname('EXCH_RATE').Value)
    else
     FrmAcctNote.stringgrid1.Cells[3,FrmAcctNote.stringgrid1.RowCount-2]:='0';
    //原币
    FrmAcctNote.stringgrid1.Cells[4,FrmAcctNote.stringgrid1.RowCount-2]:=formatfloat('0.00',
                Fieldbyname('AMOUNT').Value*Fieldbyname('EXCH_RATE').Value);

    if Fieldbyname('d_c').asstring='D' then
      FrmAcctNote.stringgrid1.Cells[5,FrmAcctNote.stringgrid1.RowCount-2]:=Fieldbyname('AMOUNT').asstring
    else
      FrmAcctNote.stringgrid1.Cells[6,FrmAcctNote.stringgrid1.RowCount-2]:=Fieldbyname('AMOUNT').asstring;
    next;
  end;

  FrmAcctNote.ttype.Caption :='2';
  FrmAcctNote.SpeedButton9.Enabled :=false;
  FrmAcctNote.StringGrid1.Options :=FrmAcctNote.StringGrid1.Options+[goRowselect];
  FrmAcctNote.showmodal;
  FrmAcctNote.free;

end;
//导出EXCEL
procedure Tmain.BitBtn3Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
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
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := 1;

 begin
   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(self.DBGrid1).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(DBGrid1).DataSource.DataSet.DisableControls;
   TDBGrid(DBGrid1).DataSource.DataSet.first;
   v_cloumn:=Floor(TDBGrid(DBGrid1).Columns.Count/2);

   Sheet.Cells[1, v_cloumn] :='会计记帐凭证一览表';

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1] :='会计期间:'+dm.ADOQ105fyear.AsString+'年'+dm.ADOQ105period.AsString +'月';
   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGrid(DBGrid1).Columns.Count - 1 do
    if TDBGrid(DBGrid1).Columns.Items[iCount].Visible=true then
      begin
       Sheet.Cells[3, iCount + 1 - v_cloumn] :=
         TDBGrid(DBGrid1).Columns.Items[iCount].Title.Caption;
       Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
      end
    else
     inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGrid(DBGrid1).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(DBGrid1).Columns.Count - 1 do
      if TDBGrid(DBGrid1).Columns.Items[iCount].Visible=true then
        begin
         Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
           TDBGrid(DBGrid1).Columns.Items[iCount].Field.AsString;

        end
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(DBGrid1).DataSource.DataSet.Next;
   end;
   XlApp.Visible := True;
   TDBGrid(DBGrid1).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure Tmain.PopupMenu1Popup(Sender: TObject);
begin
  if dm.ADOQ105.RecordCount =0 then
   begin
    n2.Enabled :=false;
    n3.Enabled :=false;
    n5.Enabled :=false;
    n6.Enabled :=false;
    n9.Enabled :=false;
    exit;
   end
  else
   begin
    n2.Enabled :=true;
    n3.Enabled :=true;
    n5.Enabled :=true;
    n6.Enabled :=true;
    n9.Enabled :=true;
   end;

 if dm.ADOQ105.FieldByName('ENTERED_BY_EMPL_PTR').asstring=
                            trim(user_ptr) then
  begin
    n2.Enabled :=false;
    n3.Enabled :=false;//'未审核';
    exit;
  end;

 if (pos('P',dm.ADOQ105voucher.AsString)>0) or
    (pos('R',dm.ADOQ105voucher.AsString)>0) then     //收付款凭证
    with dm.ADOQ105 do
      case FieldByName('STATUS').asinteger of
       0:n2.Enabled :=false;//'未审核';
       1:n2.Enabled :=false;//'会计已审';
       2:n2.Enabled :=false;//'主管已审';
       3:n2.Enabled :=false;//'已登帐';
       4:n2.Enabled :=true;//'出管已审';
      end
 else
    with dm.ADOQ105 do
      case FieldByName('STATUS').asinteger of
       0:n2.Enabled :=true;//'未审核';
       1:n2.Enabled :=false;//'会计已审';
       2:n2.Enabled :=false;//'主管已审';
       3:n2.Enabled :=false;//'已登帐';
       4:n2.Enabled :=false;//'出管已审';
      end;
 //取消审核
   with dm.ADOQ105 do
    case FieldByName('STATUS').asinteger of
      0:n3.Enabled :=false;//'未审核';
      1:n3.Enabled :=true;//'会计已审';
      2:n3.Enabled :=false;//'主管已审';
      3:n3.Enabled :=false;//'已登帐';
      4:n3.Enabled :=false;//'出纳已审';
    end;

  if DBGrid1.SelectedRows.Count=0 then
   DBGrid1.SelectedRows.CurrentRowSelected :=true;
  if DBGrid1.SelectedRows.Count >1 then
   begin
    n2.Enabled :=true;// 审核
    n3.Enabled :=true;// 取消
   end;

end;

procedure Tmain.FormCreate(Sender: TObject);

begin
  if not App_Init(dm.ADOCnn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;

end;

procedure Tmain.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-vWidth)*v_colwidth[i]/(vWidth-28));
for i:=low(v_colwidth1) to high(v_colwidth1) do
  dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid2.Width-vWidth)*v_colwidth1[i]/(vWidth-48));

end;
//单项打印
procedure Tmain.N6Click(Sender: TObject);
begin
  Form_voucherreport:=TForm_voucherreport.create(application);
  form_voucherreport.ppReport1.Reset;
  form_voucherreport.ppReport1.Template.FileName :=
   stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
  form_voucherreport.ppReport1.Template.LoadFromFile;

  Form_voucherreport.aqd105.Close;
  Form_voucherreport.aqd105.parameters[0].value:=dm.ADOQ105RKEY.value;
  Form_voucherreport.aqd105.open;
  Form_voucherreport.aqd106.Open;
  Form_voucherreport.aqd493.open;
  Form_voucherreport.ppreport1.print;
  Form_voucherreport.free;
end;
//连续打印
procedure Tmain.N5Click(Sender: TObject);
var
 i:integer;
begin
 try
  mul_Rp := Tmul_Rp.Create(application);
  if mul_Rp.ShowModal=mrok then
   begin
    Form_voucherreport:=TForm_voucherreport.create(application);
    form_voucherreport.ppReport1.Reset;
    form_voucherreport.ppReport1.Template.FileName :=
     stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
    form_voucherreport.ppReport1.Template.LoadFromFile;

    Form_voucherreport.ppreport1.ShowPrintDialog:=false;
    Form_voucherreport.ppreport1.DeviceType :='printer';
    
    for i:=1 to mul_Rp.StG2.RowCount-2 do
     begin
      Form_voucherreport.aqd105.Close;
      Form_voucherreport.aqd105.parameters[0].value:=strtoint(mul_Rp.StG2.Cells[2,i]);
      Form_voucherreport.aqd105.open;
      Form_voucherreport.aqd106.Open;
      Form_voucherreport.aqd493.open;
      Form_voucherreport.ppreport1.print;
     end;
    Form_voucherreport.free;

   end;//end if
 finally
   mul_Rp.Free;
 end;
end;
//全选
procedure Tmain.CheckBox10Click(Sender: TObject);
var
 rkey:integer;
begin

if CheckBox10.Checked=true then
 begin
  rkey:=DM.ADOQ105rkey.Value;
  DM.ADOQ105.DisableControls;
  DM.ADOQ105.First;
  while not DM.ADOQ105.Eof do
  begin
   dbgrid1.SelectedRows.CurrentRowSelected:=true;
   DM.ADOQ105.Next;
  end;
   DM.ADOQ105.EnableControls;
   DM.ADOQ105.Locate('rkey',rkey,[]);
 end;

if CheckBox10.Checked=false then
 begin

  rkey:=DM.ADOQ105RKEY.Value;
  DM.ADOQ105.DisableControls;
  DM.ADOQ105.First;
  while not DM.ADOQ105.Eof do
  begin
   if DM.ADOQ105RKEY.Value=rkey then
    dbgrid1.SelectedRows.CurrentRowSelected:=true
   else

    dbgrid1.SelectedRows.CurrentRowSelected:=false;
   DM.ADOQ105.Next;
  end;
   DM.ADOQ105.EnableControls;
   DM.ADOQ105.Locate('rkey',rkey,[]);
 end;


end;

procedure Tmain.DBGrid1CellClick(Column: TColumn);
begin
 if DBGrid1.SelectedRows.Count=1 then
  CheckBox10.Checked :=false ;
end;

procedure Tmain.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.Adoq105.SQL.Text);
end;

end.
