unit form_Main1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls,
  ExtCtrls,Pick_Item_Single,ConstVar,common,
  DB, ADODB, DBCtrlsEh, RzEdit, RzDBEdit;

type
  Tfrm_Main1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    mem_remark: TDBMemo;
    BitBtn3: TBitBtn;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    cbb_item: TDBComboBox;
    DBComboBox2: TDBComboBox;
    Label7: TLabel;
    DBComboBox3: TDBComboBox;
    edt_employeecode: TDBEdit;
    Label9: TLabel;
    edt_chinesename1: TDBEdit;
    tlb1: TToolBar;
    btInsert: TSpeedButton;
    btEdit: TSpeedButton;
    btPost: TSpeedButton;
    btCancel: TSpeedButton;
    btDelete: TSpeedButton;
    btFilter: TSpeedButton;
    btRefresh: TSpeedButton;
    btOut: TSpeedButton;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btUpload: TSpeedButton;
    btDownload: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btPrint: TSpeedButton;
    btClose: TSpeedButton;
    DataSource1: TDataSource;
    procedure btInsertClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_employeecodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBDateTimeEditEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBDateTimeEditEh2KeyPress(Sender: TObject; var Key: Char);
    procedure edt_employeecodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1StateChange(Sender: TObject);
    procedure mem_remarkKeyPress(Sender: TObject; var Key: Char);
  private
      Function PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
    { Private declarations }
  public
    function SaveCheck():Boolean;
    procedure EF(FormName:Tform);
    procedure ET(FormName:TForm;NotEditComponents:array of string);
  end;

var
  frm_Main1: Tfrm_Main1;

implementation

uses dmo, Main;

{$R *.dfm}

procedure Tfrm_Main1.ET(FormName:TForm;NotEditComponents:array of string);  //调用：ET(self);或：ET（MYFORMNAME）
var
  i,j:integer;
  vNotEdit:Boolean;
begin   //设窗口上的所有Edit和Combobox类控件可用。
  for i:=formname.ComponentCount-1 downto 0  do
  begin
    vNotEdit:=False;
    for j:=0 to High (NotEditComponents) do
    if  UpperCase(NotEditComponents[j])=UpperCase(FormName.Components[i].Name ) then
    begin
      vNotEdit:=True;
      Break   ;
      //Continue;//: 结束循环内的本次处理,继续从循环体的开始位置继续执行;
    end;

    if (FormName.Components[i] is TCustomEdit) then
     TEdit(FormName.Components[i]).ReadOnly:=vNotEdit
    else
    if (FormName.Components[i] is TDBMemo) then
      TDBMemo(FormName.Components[i]).ReadOnly:=vNotEdit
    else
    if (FormName.Components[i] is TDBComboBox) then
      TDBComboBox(FormName.Components[i]).ReadOnly:=vNotEdit
    else
    if (FormName.Components[i] is TDBDateTimeEditEh) then
      begin
      TDBDateTimeEditEh(FormName.Components[i]).ReadOnly:=vNotEdit;
      TDBDateTimeEditEh(FormName.Components[i]).Enabled:= not vNotEdit;
      end;
  end;
end;

procedure Tfrm_Main1.EF(FormName:TForm);  //调用：ET(self);或：ET（MYFORMNAME）
  var i:integer;
begin        //设窗口上的所有Edit和Combobox类控件不可用。
  for i:=0 to  formname.ComponentCount-1 do
  begin
    if (FormName.Components[i] is TDBEdit) then
      begin
      (FormName.Components[i]as TDBEdit).ReadOnly:=True;
     // ShowMessage(TDBEdit(FormName.Components[i]).Name)
      end
    else
    if (FormName.Components[i] is TDBMemo) then
      TDBMemo(FormName.Components[i]).ReadOnly:=True
    else
    if (FormName.Components[i] is TDBComboBox) then
      TDBComboBox(FormName.Components[i]).ReadOnly:=True
    else
    if (FormName.Components[i] is TDBDateTimeEditEh) then
      begin
      TDBDateTimeEditEh(FormName.Components[i]).ReadOnly:=True;
      TDBDateTimeEditEh(FormName.Components[i]).Enabled:= False;
      end;
  end;
end;

Function Tfrm_Main1.PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
//var
//  myqu:TADOquery;
begin
  try
    Result:=False;
    AQ.Close;
    AQ.SQL.Clear;
    AQ.SQL.Add(sql);
    AQ.Open; //功能：通过执行SQL语句（可以是多表复杂查找），查找相关表中是否存在相关记录，即存在查找。如果找到返回真值，否则返回假值。
//用法：if PrimKeyExists('select * from GongYingShang where 供应商编号='+ quotedstr(trim(ADODateSet1.FieldByName('供应商编号').AsString )))=false then showmessage('不存在');
    if AQ.IsEmpty=False then
    Result:=true ;
  finally
   // myqu.Free;
  end;
end;

procedure Tfrm_Main1.btInsertClick(Sender: TObject);
begin
  with DM.cdsHrcertificate do
  if Active then
  Append;
end;

function Tfrm_Main1.SaveCheck():Boolean;
var
  strMsg,strSQL:string;
begin
  Result:=False;
  strMsg:='';
  with  DM.cdsHrcertificate do
  begin
    if FieldByName('employeeid') .IsNull then
    strMsg:=strMsg+FieldByName('chinesename').DisplayLabel +'：的值不能为空！！！';
    if FieldByName('code') .IsNull then
    strMsg:=strMsg+#13+FieldByName('code').DisplayLabel +'：的值不能为空！！！';
    if FieldByName('datadetail_ptr').IsNull  then
    strMsg:=strMsg+#13+FieldByName('item').DisplayLabel +'：的值不能为空！！！';
    if (FieldByName('type').IsNull) then
    strMsg:=strMsg+#13+FieldByName('type').DisplayLabel +'：的值不能为空！！！';
    if FieldByName('startdate').IsNull then
    strMsg:=strMsg+#13+FieldByName('startdate').DisplayLabel +'：的值不能为空！！！';
//    if (FieldByName('enddate').IsNull)then
//    strMsg:=strMsg+#13+FieldByName('enddate'). DisplayLabel+'：的值不能为空';
    if (FieldByName('status').IsNull)then
    strMsg:=strMsg+#13+FieldByName('status'). DisplayLabel+'：的值不能为空';

    if (UpdateStatus=usInserted)and(FieldByName('employeeid').IsNull=False)and(cbb_item.Text<>'') then
    begin
      strSQL:='select * from dbo.Hrcertificate where employeeid='+FieldByName('employeeid').AsString
         +' and datadetail_ptr='+FieldByName('datadetail_ptr').AsString;
      //ShowMessage(strSQL)   ;
      if PrimKeyExists(DM.ADOQuery1,strSQL)   then
      strMsg:=strMsg+#13+FieldByName('employeecode').DisplayLabel+'：'+FieldByName('employeecode').AsString
                    +'，'+FieldByName('item').DisplayLabel+'：'+FieldByName('item').AsString
                    +#13+'该记录已经存在！！！';
    end;
  end;

  if strMsg<>'' then
  begin
    ShowMessage(strMsg);
    Result:=True;
  end;
end;

procedure Tfrm_Main1.btPostClick(Sender: TObject);
begin
  with DM.cdsHrcertificate do
  begin
    if  State in [dsEdit,dsInsert ]  then
    Post;
    if SaveCheck=False then
    begin
      if changeCount >0 then
      ApplyUpdates(0);
    end
    else
    Abort;
  end;
  DataSource1StateChange(nil);
end;

procedure Tfrm_Main1.btCancelClick(Sender: TObject);
begin
  with DM.cdsHrcertificate do
  if Active=True then
  begin
    Cancel;
    CancelUpdates;
  end;
end;

procedure Tfrm_Main1.btDeleteClick(Sender: TObject);
var
  s,i:integer;
begin
  with DM.cdsHrcertificate do
  if Active and (not IsEmpty) then
  begin
    if messagedlg('你确定要删除吗?删除后将不能恢复！',mtconfirmation,[mbyes,mbno],0) = mryes  then
    begin
      if UpdateStatus=usInserted then
        CancelUpdates
      else
      begin
        if State=dsEdit then
        Cancel;
        Delete;
        ApplyUpdates(0);
      end;
    end;
  end;
end;

procedure Tfrm_Main1.btPriorClick(Sender: TObject);
begin
  with DM.cdsHrcertificate do
  if Active then
  Prior;
end;

procedure Tfrm_Main1.btNextClick(Sender: TObject);
begin
  with DM.cdsHrcertificate do
  if Active then
  Next;
end;

procedure Tfrm_Main1.btRefreshClick(Sender: TObject);
var
  i_employeeid,i_datadetail_ptr :Integer;
  D_inputdate:TDateTime;
begin
  i_employeeid     := DM.cdsHrcertificate.fieldByName('employeeid').Value;
  i_datadetail_ptr := DM.cdsHrcertificate.fieldByName('datadetail_ptr').Value;
  D_inputdate      := DM.cdsHrcertificate.fieldByName('inputdate').Value;
  DM.cdsHrcertificate.Refresh;
  DM.cdsHrcertificate.Locate('employeeid;datadetail_ptr;inputdate',VarArrayOf([i_employeeid,i_datadetail_ptr,D_inputdate]),[]) ;
//  with DM.cdsHrcertificate do
//  if Active then
//  begin
//    bm:= DM.cdsHrcertificate.GetBookmark;
//    try
//      DM.cdsHrcertificate.Close;
//      DM.cdsHrcertificate.Open;
//
//      DM.cdsHrcertificate.GotoBookmark(bm);
//    finally
//      DM.cdsHrcertificate.FreeBookmark(bm);
//    end;
//  end
end;

procedure Tfrm_Main1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with DM.cdsHrcertificate do
  if Active then
  if  (State in [dsInsert,dsEdit])or (ChangeCount>0 )then
  begin
     S:= messagedlg('数据还没有保存,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0);
     if S = mryes  then
       begin
         if  (State in [dsInsert,dsEdit]) then
         Post  ;
         if SaveCheck then
         Abort;
         ApplyUpdates(0);
       end
     else
     if S = mrcancel then
         abort
     else
     if s=mrNo then
       begin
         Cancel    ;
         CancelUpdates;
       end;
  end;

end;

procedure Tfrm_Main1.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(Application);
  try
    InputVar.Fields := 'employeecode/员工编号/200,chinesename/员工姓名/200';
    InputVar.Sqlstr :='select rkey,chinesename,employeecode from employeemsg';
    InputVar.AdoConn := DM.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      //Edit1.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      if Not(DM.cdsHrcertificate.State in [dsEdit,dsInsert]) then
        DM.cdsHrcertificate.Edit;
      edt_employeecode.Field.Value:= frmPick_Item_Single.adsPick.FieldValues['employeecode'];
      edt_employeecode.SetFocus;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tfrm_Main1.FormCreate(Sender: TObject);
begin
  Frm_Main.DataSetAddToCombobox(DM.dt_dictid,frm_Main1.cbb_item,'item');
  frm_Main1.cbb_item.DataSource:=DM.DataSource1  ;
end;

procedure Tfrm_Main1.edt_employeecodeKeyPress(Sender: TObject;
  var Key: Char);
var
  i:Integer;
begin   {
  if key = #13 then
  begin
    if Sender is TWinControl  then
    if (Sender as TWinControl )  =mem_remark then
    if mem_remark.ReadOnly=False then
    begin
      btPost.Click;
      btInsert.Click;
      edt_employeecode.SetFocus;
      Exit;
    end;

    if  Sender is TDBComboBox then
    begin
      with (Sender as TDBComboBox) do
      if  (Field.Required)and(ReadOnly=False) then
      if  Trim(Text)='' then
      begin
        (Sender as TDBComboBox).DroppedDown := true;
        Exit;
      end;
    end
    else
    if  Sender is TDBEdit then
    begin
      with (Sender as TDBEdit) do
      if  (Field.Required)and(ReadOnly=False)then
      begin
        if (Sender as TDBEdit )=edt_employeecode then
        BitBtn3.Click;
        if  Trim(Text)='' then
        Exit;
      end
    end;
//    for   i:=0 to Self.ControlCount-1 do
//    begin
//      if  Controls[i] is TWinControl then
//      if (Controls[i] as TWinControl).TabOrder= (Sender as TWinControl).TabOrder+1 then
//      (Controls[i] as TWinControl).SetFocus;
//    end;
    Perform(WM_NEXTDLGCTL, 0, 0);

//    Self.SelectNext();
//    postmessage(self.handle,wm_keydown,vk_tab,0);
  end  ;   }
end;

procedure Tfrm_Main1.DBDateTimeEditEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  Key:=Char(0);
end;

procedure Tfrm_Main1.DBDateTimeEditEh2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
  Key:=Char(0);
end;

procedure Tfrm_Main1.edt_employeecodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if Sender is TWinControl  then
    if (Sender as TWinControl )  =mem_remark then
    if mem_remark.ReadOnly=False then
    begin
      btPost.Click;
      btInsert.Click;
      edt_employeecode.SetFocus;
      Exit;
    end;

    if  Sender is TDBComboBox then
    begin
      with (Sender as TDBComboBox) do
      if  (Tag=1)and(ReadOnly=False) then
      if  Trim(Text)='' then
      begin
        (Sender as TDBComboBox).DroppedDown := true;
        Exit;
      end;
    end
    else
    if  Sender is TDBEdit then
    begin
      with (Sender as TDBEdit) do
      if (Tag=1)and(ReadOnly=False)then
      begin
        if (Sender as TDBEdit )=edt_employeecode then
        if Trim(Text)='' then
        BitBtn3.Click;
        if  Trim(Text)='' then
        Exit;
      end
    end;
    Postmessage(handle,WM_KEYDOWN,VK_TAB,0);
  end;
end;

procedure Tfrm_Main1.DataSource1StateChange(Sender: TObject);
begin
  with  DM.cdsHrcertificate  do
    if  (State in[dsEdit,dsInsert])or(ChangeCount>0) then
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btPost.Enabled:=(StrToInt(vprev)in [2,4]);
      btCancel.Enabled:=True;
      btDelete.Enabled:=False;
      btRefresh.Enabled:=False;
      btNext.Enabled:=False;
      btPrior.Enabled:=False;
    //  BitBtn3.Enabled:=(StrToInt(vprev)in [2,4]);
    end
    else
    begin
      btInsert.Enabled:=(StrToInt(vprev)in [2,4]);
      btEdit.Enabled:=(StrToInt(vprev)in [2,4]);
      btPost.Enabled:=False;
      btCancel.Enabled:=False;
      btDelete.Enabled:=(StrToInt(vprev)in [2,4]);
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
 //     BitBtn3.Enabled:= False;
    end;
    BitBtn3.Enabled:=(StrToInt(vprev)in [2,4]);
end;

procedure Tfrm_Main1.mem_remarkKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  key:=Char(0)
end;

end.
