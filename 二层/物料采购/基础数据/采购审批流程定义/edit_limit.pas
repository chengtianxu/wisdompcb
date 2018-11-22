unit edit_limit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, DBCtrls, Mask, ToolWin, ComCtrls,
  DBEditBit, RzEdit, RzDBEdit, RzDBBnEd, DBButtonEdit;

type
  TForm3 = class(TForm)
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    cbb_PURCHASE_TYPE: TDBComboBox;
    tlb1: TToolBar;
    btInsert: TSpeedButton;
    btPost: TSpeedButton;
    btEdit: TSpeedButton;
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
    Label16: TLabel;
    DBEdit1: TDBEdit;
    Label17: TLabel;
    edt_upper_limit: TDBEdit;
    edt_warehouse_code: TDBButtonEdit;
    edt_user_id: TDBButtonEdit;
    procedure btCloseClick(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_upper_limitKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    //  procedure DataSetAddToCombobox(ADataSet:TDataSet;co:TCustomComboBox;FieldName:string='');
      
      Function PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
    { Private declarations }
  public
    function SaveCheck():Boolean;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses csi_search, main,pick_item_single,common,constvar;

{$R *.dfm}
Function TForm3.PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
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

function TForm3.SaveCheck():Boolean;
var
  strMsg,strSQL:string;
begin
  Result:=False;
  strMsg:='';
  with  Form1.cdsMain do
  begin
    if FieldByName('PURCHASE_TYPE') .IsNull then
    strMsg:=strMsg+FieldByName('PURCHASE_TYPE').DisplayLabel +'：的值不能为空！！！';
    if FieldByName('warehouse_ptr') .IsNull then
    strMsg:=strMsg+#13+FieldByName('ABBR_NAME').DisplayLabel +'：的值不能为空！！！';
    if FieldByName('user_ptr').IsNull  then
    strMsg:=strMsg+#13+FieldByName('USER_FULL_NAME').DisplayLabel +'：的值不能为空！！！';
    if (FieldByName('seq_no').IsNull)or(FieldByName('seq_no').AsFloat<0)  then
    strMsg:=strMsg+#13+FieldByName('seq_no').DisplayLabel +'：的值必须大于0！！！';
    if FieldByName('lower_limit').AsString='' then //额度下限
    strMsg:=strMsg+#13+FieldByName('lower_limit').DisplayLabel +'：的值必须大于0！！！';
    if (FieldByName('upper_limit').IsNull)or(FieldByName('upper_limit').AsFloat<=FieldByName('lower_limit').AsFloat) then //额度上限
    strMsg:=strMsg+#13+FieldByName('upper_limit'). DisplayLabel+'的值必须大于'+FieldByName('lower_limit'). DisplayLabel  +'的值！！！';

    if (cbb_PURCHASE_TYPE.Text<>'')and(edt_warehouse_code.Text<>'')and(edt_user_id.Text<>'') then
    if (UpdateStatus=usInserted)
     or((UpdateStatus=usModified) and ((UpperCase(FieldByName('PURCHASE_TYPE').NewValue)<>UpperCase(FieldByName('PURCHASE_TYPE').OldValue))or
                                       (UpperCase(FieldByName('warehouse_code').NewValue)<>UpperCase(FieldByName('warehouse_code').OldValue)) or
                                       (UpperCase(FieldByName('user_ptr').NewValue)<>UpperCase(FieldByName('user_ptr').OldValue))  )
       ) then
    begin
      strSQL:='select * from dbo.data0077 where user_ptr='+FieldByName('user_ptr').AsString
         +' and warehouse_ptr='+FieldByName('warehouse_ptr').AsString+'  and PURCHASE_TYPE='+QuotedStr(FieldByName('PURCHASE_TYPE').AsString);
      //ShowMessage(strSQL)   ;
      if PrimKeyExists(Form1.AQTemp,strSQL)   then
      strMsg:=strMsg+#13+'该记录已经存在！！！';
    end;
  end;

  if strMsg<>'' then
  begin
    ShowMessage(strMsg);
    Result:=True;
  end;
end;



procedure TForm3.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm3.btInsertClick(Sender: TObject);
begin
  with Form1.cdsMain do
  begin
    if Active=True then
    Append;
  end;
  cbb_PURCHASE_TYPE.SetFocus;
end;

procedure TForm3.btEditClick(Sender: TObject);
begin
  with Form1.cdsMain do
  begin
    if Active=True then
    Edit;
  end;
end;

procedure TForm3.btPostClick(Sender: TObject);
begin
  with Form1.cdsMain do
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
  Form1.dsMainStateChange(Form1.dsMain);
end;

procedure TForm3.btCancelClick(Sender: TObject);
begin
  with Form1.cdsMain do
  begin
    if Active=True then
    begin
      Cancel;
      CancelUpdates;
    end;
  end;
end;

procedure TForm3.btDeleteClick(Sender: TObject);
begin

  with Form1.cdsMain do
  begin
    if Active=True then
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

procedure TForm3.btRefreshClick(Sender: TObject);
begin
  with Form1.cdsMain do
  begin
    if Active=True then
    begin
      Refresh;
    end;
  end;
end;

procedure TForm3.btPriorClick(Sender: TObject);
begin
  with Form1.cdsMain do
  begin
    if Active=True then
    begin
      Prior;
    end;
  end;
end;

procedure TForm3.btNextClick(Sender: TObject);
begin
  with Form1.cdsMain do
  begin
    if Active=True then
    begin
      Next;
    end;
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with Form1.cdsMain do
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

procedure TForm3.edt_upper_limitKeyPress(Sender: TObject; var Key: Char);
var
  i:Integer;
begin
  if key=#13 then
  begin
    if Sender is TDBEdit  then
    if (Sender as TDBEdit )  =edt_upper_limit then
    begin
      btPost.Click;
      btInsert.Click;
      Exit;
    end;

    if  Sender is TDBButtonEdit then
    begin
      with (Sender as TDBButtonEdit) do
      if  Field.Required then
      if  Trim(Text)='' then
      begin
        (Sender as TDBButtonEdit).ClickForm(Sender);//((Sender as TDBButtonEdit).FButton);
        Exit;
      end;
    end
    else
    if  Sender is TDBComboBox then
    begin
      with (Sender as TDBComboBox) do
      if  Field.Required then
      if  Trim(Text)='' then
      begin
        (Sender as TDBComboBox).DroppedDown := true;
        Key:=Char( 0);
        Exit;
      end;
    end
    else
    if  Sender is TDBEdit then
    begin
      with (Sender as TDBEdit) do
      if  Field.Required then
      if  Trim(Text)='' then
        Exit;
    end;
    for   i:=0 to Self.ControlCount-1 do
    begin
      if  Controls[i] is TWinControl then
      if (Controls[i] as TWinControl).TabOrder= (Sender as TWinControl).TabOrder+1 then
      (Controls[i] as TWinControl).SetFocus;
     // if  Controls[i].tab
    end;

   // postmessage(self.handle,wm_keydown,vk_tab,0);
  end
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Form1.DataSetAddToCombobox(Form1.AQdistinctPURCHASE_TYPE,cbb_PURCHASE_TYPE);
end;

end.
