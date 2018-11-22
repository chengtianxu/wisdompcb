unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, Mask,
  DBCtrls, ExtCtrls, Excel2000,ClipBrd, Spin,ComObj, DBGridEh;

type
  Tmain = class(TForm)
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N10: TMenuItem;
    N9: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    Splitter1: TSplitter;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label4: TLabel;
    ComboBox1: TComboBox;
    GroupBox3: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox6: TCheckBox;
    Splitter2: TSplitter;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    BitBtn4: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

    procedure N9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
  private
   field_name:string;
   PreColumn:TColumnEh;
   sql_text:string;
   OldGridWnd : TWndMethod;
   v_colwidth,v_colwidth1: array of integer;
   vWidth:integer;
   FCurrdate:TDate;
   FY,FM:word;
   procedure NewGridWnd(var Message: TMessage);
  public

  end;

var
  main: Tmain;

implementation

uses uDM,DateUtils, AcctNote,math,RpCon, RpConDS,common,
     RpBase, RpSystem, RpDefine,voucher_report, uRpCons,condition, ADODB;

{$R *.dfm}

procedure Tmain.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOCnn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption :=Application.Title;


 // vprev:='1';
 // DM.ADOCnn.Open;


  vWidth:=dbgridEh1.Width;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGridEh1.WindowProc;
  DBGridEh1.WindowProc := NewGridWnd;
end;

procedure Tmain.FormShow(Sender: TObject);
VAR
  i:integer;
begin
 if  dm.ADOCnn.Connected then
 begin
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select curr_fyear,curr_period,getdate() from data0508';
  dm.tmp.Open;
  FY:=dm.tmp.Fields[0].AsInteger;
  FM:=dm.tmp.Fields[1].AsInteger;
  FCurrdate:=dm.tmp.Fields[2].AsDateTime;

  self.ComboBox1.ItemIndex :=combobox1.Items.Count -1;
  dm.ADOQ105.Parameters.ParamByName('vDt1').Value :=EncodeDate(FY, FM, 1);
  dm.ADOQ105.Parameters.ParamByName('vDt2').Value :=FCurrdate;

  sql_text:=dm.ADOQ105.SQL.Text;
  CheckBox1Click(sender);//显示
  DM.ADODS106.Close ;
  DM.ADODS106.Open ;
  field_name:=DBGridEh1.Columns[0].FieldName;
  PreColumn:=DBGridEh1.Columns[0];

  setlength(v_colwidth,DBGridEh1.FieldCount);
  setlength(v_colwidth1,dbgrid2.FieldCount);
  for i:=0 to high(v_colwidth) do v_colwidth[i]:=DBGridEh1.Columns[i].Width;
  for i:=0 to high(v_colwidth1) do v_colwidth1[i]:=dbgrid2.Columns[i].Width;
 end;
end;

procedure Tmain.NewGridWnd(var Message: TMessage);
   var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGridEh1.DataSource.DataSet.MoveBy(1)
   else
     DBGridEh1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure Tmain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure Tmain.Edit1Change(Sender: TObject);
begin
  if trim(edit1.text)<>'' then
    dm.ADOQ105.Filter :=field_name+' like ''%'+trim(edit1.text)+'%'''
  else
    dm.ADOQ105.Filter :='';
end;

procedure Tmain.CheckBox1Click(Sender: TObject);
begin
  with DM.ADOQ105 do
  begin
   close;
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

   if not Checkbox10.Checked  then                 //特殊转帐凭证
    Parameters.ParamByName('vptr5').Value :=4
   else
    parameters.ParamByName('vptr5').Value :=9;

   //凭证状态(审核
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

   if not Checkbox11.Checked  then
     parameters.ParamByName('vstatus6').Value :=5
   else
     parameters.ParamByName('vstatus6').Value :=9;

   sql.Delete(sql.Count-2);

   if combobox1.ItemIndex<>combobox1.Items.Count-1 then  //不是最后一行
    sql.Insert(sql.Count-1,'and TRANS_TYPE='+inttostr(combobox1.ItemIndex+1))
   else
    sql.Insert(sql.Count-1, '');
   screen.Cursor:=crSQLWait;
   Prepared;
   open;
   screen.Cursor:=crDefault;
   Caption:=application.Title+inttostr(RecordCount)+'张';
 end;

end;

procedure Tmain.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure Tmain.N9Click(Sender: TObject);//查询
begin
  Application.CreateForm(TFrmAcctNote, FrmAcctNote);
  FrmAcctNote.PopupMenu1.Free;
  FrmAcctNote.Edit6.text:=DM.ADOQ105.FieldByName('voucher').asstring;
  FrmAcctNote.batch_number.Text:=dm.ADOQ105BATCH_NUMBER.Value;
  FrmAcctNote.datetimepicker1.DateTime :=DM.ADOQ105.fieldbyname('entered_dt').asdatetime;
  FrmAcctNote.datetimepicker1.Enabled :=false;
  FrmAcctNote.edit5.Text :=DM.ADOQ105.fieldbyname('attached').asstring;
  FrmAcctNote.edit15.Text :=DM.ADOQ105.fieldbyname('entered').asstring;
  FrmAcctNote.edit1.Text :=DM.ADOQ105.fieldbyname('FYEAR').AsString;
  FrmAcctNote.edit4.Text :=DM.ADOQ105.fieldbyname('PERIOD').AsString;
  FrmAcctNote.Label4.Caption:=dm.ADOQ105ctype.Value;
  DM.ADODS106.First ;
  with DM.ADODS106 do
  while not eof do
  begin
    FrmAcctNote.stringgrid1.RowCount:=FrmAcctNote.stringgrid1.RowCount+1;
    FrmAcctNote.stringgrid1.Cells[0,FrmAcctNote.stringgrid1.RowCount-2]:=Fieldbyname('description').asstring;
    FrmAcctNote.stringgrid1.Cells[1,FrmAcctNote.stringgrid1.RowCount-2]:=
    trim(Fieldbyname('gl_acc_number').Value)+'-'+trim(Fieldbyname('Cgl_Acc').Value);

    FrmAcctNote.stringgrid1.Cells[2,FrmAcctNote.stringgrid1.RowCount-2]:=Fieldbyname('CURR_CODE').asstring;
    if dm.ADODS106EXCH_RATE.Value>0 then
     FrmAcctNote.stringgrid1.Cells[3,FrmAcctNote.stringgrid1.RowCount-2]:=
       formatfloat('0.00000000',1/Fieldbyname('EXCH_RATE').Value)
    else
     FrmAcctNote.stringgrid1.Cells[3,FrmAcctNote.stringgrid1.RowCount-2]:='0';
    FrmAcctNote.stringgrid1.Cells[4,FrmAcctNote.stringgrid1.RowCount-2]:=
       dm.ADODS106PRICE.AsString;
//    formatfloat('0.00',Fieldbyname('AMOUNT').Value*Fieldbyname('EXCH_RATE').Value);//原币

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


procedure Tmain.BitBtn3Click(Sender: TObject);    //导出EXCEL
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
   if not TDBGridEh(self.DBGridEh1).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGridEh(DBGridEh1).DataSource.DataSet.DisableControls;
   TDBGridEh(DBGridEh1).DataSource.DataSet.first;
   v_cloumn:=Floor(TDBGridEh(DBGridEh1).Columns.Count/2);

   Sheet.Cells[1, v_cloumn] :='会计记帐凭证一览表';

    // Sheet.Cells[1, v_cloumn].Font.Reset;
     Sheet.Cells[1, v_cloumn].Font.bold := True;
     Sheet.Cells[1, v_cloumn].Font.Size := 16;

 //  Sheet.Cells[2, v_cloumn+1] :='会计期间:'+dm.ADOQ105fyear.AsString+'年'+dm.ADOQ105period.AsString +'月';
   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGridEh(DBGridEh1).Columns.Count - 1 do
    if TDBGridEh(DBGridEh1).Columns.Items[iCount].Visible=true then
      begin
       Sheet.Cells[3, iCount + 1 - v_cloumn] :=
         TDBGridEh(DBGridEh1).Columns.Items[iCount].Title.Caption;
       Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
      end
    else
     inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGridEh(DBGridEh1).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGridEh(DBGridEh1).Columns.Count - 1 do
      if TDBGridEh(DBGridEh1).Columns.Items[iCount].Visible=true then
        begin
         Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
           TDBGridEh(DBGridEh1).Columns.Items[iCount].Field.AsString;

        end
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGridEh(DBGridEh1).DataSource.DataSet.Next;
   end;
   XlApp.Visible := True;
   TDBGridEh(DBGridEh1).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;
//打印
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

procedure Tmain.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  DBGridEh1.Columns[i].Width:=v_colwidth[i]+round((DBGridEh1.Width-vWidth)*v_colwidth[i]/(vWidth-26));
for i:=low(v_colwidth1) to high(v_colwidth1) do
  dbgrid2.Columns[i].Width:=v_colwidth1[i]+round((dbgrid2.Width-vWidth)*v_colwidth1[i]/(vWidth-28));
end;

procedure Tmain.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and              //如果是下箭头如果是最后一条记录
   (dm.ADODS106.RecNo=dm.ADODS106.RecordCount) then abort;

 if (ssCtrl	in shift) and (key=46) then  //用户按下ctrl+del键
  abort
end;

procedure Tmain.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.ADOQ105.SQL.Text);
end;

procedure Tmain.BitBtn1Click(Sender: TObject);
var i:integer;
begin
  if Form_condition=nil then
  begin
    Form_condition:=TForm_condition.Create(nil);
    Form_condition.dtpk1.Date:=EncodeDate(FY, FM, 1);
    Form_condition.dtpk2.Date:=FCurrdate;
  end;
  with form_condition do
  begin
    if ShowModal=mrok then
    with dm.ADOQ105 do
    begin
      close;
      sql.Text:=self.sql_text;
      for i:=1 to form_condition.SGrid1.RowCount-2 do
      sql.Insert(sql.Count-2,form_condition.SGrid1.Cells[2,i]) ;

     // sql.Text:=sql.Text+form_condition.SGrid1.Cells[2,i]+#13;
      Parameters.ParamValues['vDt1']:=strtodate(formatdatetime('yyyy-mm-dd',form_condition.dtpk1.Date));
      Parameters.ParamValues['vDt2']:=strtodate(formatdatetime('yyyy-mm-dd',form_condition.dtpk2.Date))+1;
      CheckBox1Click(sender);//显示
    end;
  end;
end;

procedure Tmain.DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADOQ105status.value=5 then
  DBGridEh1.Canvas.Font.Color := clRed;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tmain.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADOQ105.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADOQ105.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if field_name <> column.FieldName then
  begin
    label3.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure Tmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_condition.Free;
end;

procedure Tmain.BitBtn4Click(Sender: TObject);
begin
Form_voucherreport:=tForm_voucherreport.Create(application);
Form_voucherreport.ppReport1.Reset;
Form_voucherreport.ppReport1.Template.FileName :=
  stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'VOUCHER_REPORT.rtm';  //D:\SJSYS\NIERP\REPORT\VOUCHER_REPORT.rtm
Form_voucherreport.ppReport1.Template.LoadFromFile;
Form_voucherreport.ppReport1.SaveAsTemplate:=true;
Form_voucherreport.ppDesigner1.ShowModal;
Form_voucherreport.Free;
end;

end.
