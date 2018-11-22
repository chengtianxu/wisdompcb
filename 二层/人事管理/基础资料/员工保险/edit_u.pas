unit edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, DB, StdCtrls, Mask, DBCtrls,ExtCtrls,ConstVar,
  ADODB, DBCtrlsEh, RzEdit, RzDBEdit,StrUtils;

type
  Tfrm_edit = class(TForm)
    DataSource1: TDataSource;
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
    cbb_item: TDBComboBox;
    DBEdit2: TDBEdit;
    edt_chinesename1: TDBEdit;
    edt_employeecode: TDBEdit;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    lbl2: TLabel;
    lbl1: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Function PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
  public
    function SaveCheck():Boolean;
    procedure EF(FormName:Tform);
    procedure ET(FormName:TForm;NotEditComponents:array of string);
  end;

var
  frm_edit: Tfrm_edit;

implementation

uses damo,Pick_Item_Single,common, main_u;

{$R *.dfm}

procedure Tfrm_edit.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(Application);
  try
    InputVar.Fields := 'employeecode/员工编号/200,chinesename/员工姓名/200';
    InputVar.Sqlstr :='select rkey,chinesename,employeecode from employeemsg';
    InputVar.AdoConn := DM.con1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      //Edit1.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
      if Not(DM.ds3.State in [dsEdit,dsInsert]) then
        DM.ds3.Edit;
      edt_employeecode.Field.Value:= frmPick_Item_Single.adsPick.FieldValues['employeecode'];
      edt_employeecode.SetFocus;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure Tfrm_edit.FormCreate(Sender: TObject);
begin
  Frm_Main.DataSetAddToCombobox(DM.dt_dictid,frm_edit.cbb_item,'item');
  frm_edit.cbb_item.DataSource:=DM.ds1  ;
  if dm.dt_v_employeemsg.Active = False then dm.dt_v_employeemsg.Open;
end;


function Tfrm_edit.SaveCheck():Boolean;
var
  strMsg,strSQL,date_s:string;
  date_e: TDateTime;
begin
  Result:=False;
  strMsg:='';
  with  DM.ds3 do
  begin
    if FieldByName('employeeid') .IsNull then
    strMsg:=strMsg+FieldByName('chinesename').DisplayLabel +'：的值不能为空！！！';
    if FieldByName('insurance_type').IsNull  then
    strMsg:=strMsg+#13+FieldByName('item').DisplayLabel +'：的值不能为空！！！';

    if FieldByName('yearmonth') .IsNull then
          begin
          strMsg:=strMsg+'#13字段：'
          +FieldByName('yearmonth').DisplayLabel +'：的值不能为空！！！'+#13;
          end
          else
          begin
            date_s:=FieldByName('yearmonth').AsString; 
            if    length(date_s)= 6  then
            date_s := LeftStr(FieldByName('yearmonth').AsString,4)+'-'
                      +rightStr(FieldByName('yearmonth').AsString,2)+'-01'
            else date_s :='';  
            if  not   TryStrTodate(date_s,date_e)   then
            strMsg:=strMsg+'#13字段：'
            +FieldByName('yearmonth').DisplayLabel +'：的值格式不对！！！'+#13;
          end; 
    if (UpdateStatus=usInserted)and(FieldByName('employeeid').IsNull=False)and(cbb_item.Text<>'') then
    begin
      strSQL:='select * from dbo.employee_insurance where employeeid='+FieldByName('employeeid').AsString
               +' and insurance_type='+FieldByName('insurance_type').AsString
               +' and yearmonth='+FieldByName('yearmonth').AsString;
      //ShowMessage(strSQL)   ;
      if PrimKeyExists(DM.ADOQuery1,strSQL)   then
      strMsg:=strMsg+#13+FieldByName('employeecode').DisplayLabel+'：'+FieldByName('employeecode').AsString
                    +'，'+FieldByName('item').DisplayLabel+'：'+FieldByName('item').AsString
                    +'，'+FieldByName('yearmonth').DisplayLabel+'：'+FieldByName('yearmonth').AsString
                    +#13+'该记录已经存在！！！';
    end;
  end;

  if strMsg<>'' then
  begin
    ShowMessage(strMsg);
    Result:=True;
  end;
end;

Function Tfrm_edit.PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
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

procedure Tfrm_edit.ET(FormName:TForm;NotEditComponents:array of string);  //调用：ET(self);或：ET（MYFORMNAME）
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

procedure Tfrm_edit.EF(FormName:TForm);  //调用：ET(self);或：ET（MYFORMNAME）
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

procedure Tfrm_edit.DataSource1StateChange(Sender: TObject);
begin
    with  DM.ds3  do
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

procedure Tfrm_edit.btPostClick(Sender: TObject);
begin
  with DM.ds3 do
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

procedure Tfrm_edit.DBEdit1Exit(Sender: TObject);
begin
  try
  lbl2.Caption := FloatToStr(
  StrToFloat(dbedit1.Text)+ StrToFloat(dbedit4.Text)
  +StrToFloat(dbedit6.Text)+ StrToFloat(dbedit3.Text)+StrToFloat(dbedit7.Text)
  +StrToFloat(dbedit8.Text));
  except
    Abort;
    ShowMessage('数值转换失败');
    Self.SetFocus;    
  end;
end;

procedure Tfrm_edit.btPriorClick(Sender: TObject);
begin
  with DM.ds3 do
  if Active then
  Prior;
end;

procedure Tfrm_edit.btNextClick(Sender: TObject);
begin
  with DM.ds3 do
  if Active then
  Next;
end;

procedure Tfrm_edit.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with DM.ds3 do
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

end.
