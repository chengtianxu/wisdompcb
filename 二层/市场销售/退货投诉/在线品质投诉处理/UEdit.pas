unit UEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh, Mask, Menus,
  DBCtrls, ComCtrls, DBGrids,ADODB;

type
  TfrmEdit = class(TForm)
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label1: TLabel;
    Edit12: TEdit;
    BitBtn7: TBitBtn;
    Edit13: TEdit;
    BitBtn8: TBitBtn;
    Memo4: TMemo;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox2: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DataSource1: TDataSource;
    PopupMenu2: TPopupMenu;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    OpenDialog1: TOpenDialog;
    DataSource2: TDataSource;
    pnl1: TPanel;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    DBGridEh1: TDBGridEh;
    GroupBox5: TGroupBox;
    DBGrid4: TDBGrid;
    pnl2: TPanel;
    pnl3: TPanel;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu2Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
        vkey0058 :integer;
    vEditMode:integer;
    vrkey0039:integer;
    vrkey0006:integer;
    vqty_backlog,vpanels:integer;
    vreprkey0034:integer;
    vuser_ptrCaption:string;
    vstep :integer;
    vflow_no :integer;
    vsave2:integer;
    vrkey0034:integer;
    vqty_org_rej:integer;
    vrkey0118:integer;
    vrkey0010:integer;
    vrkey0025:integer;
    procedure update_filename();

    function Get_key0058: integer;
    procedure Set_EditMode(const Value: integer);
    procedure Set_key0058(const Value: integer);
    procedure Showcombobox1Text2(const value1,value2,value3:integer);
    procedure Set_user_ptrCaption(const Value: string);
    procedure Set_flow_no(const Value: integer);
    procedure Set_reprkey0034(const Value: integer);
    procedure Set_rkey0006(const Value: integer);
    procedure Set_rkey0034(const Value: integer);
    procedure Set_rkey0039(const Value: integer);
    procedure Set_step(const Value: integer);
    procedure Set_qty_org_rej(const Value: integer);
    procedure Set_rkey0118(const Value: integer);

    function ShowDATA0010_2(CONST VALUE:INTEGER;VAR VALUE1: TEdit;VAR VALUE2:TLabel):BOOLEAN;
    function ShowDATA0025_2(CONST VALUE:INTEGER;VAR VALUE1: TEdit;VAR VALUE2:TLabel):BOOLEAN;
  public
    { Public declarations }
     Frkey101:integer;
     file_name:Tstringlist;
     property key0058:integer read Get_key0058 write Set_key0058;
     property EditMode:integer write Set_EditMode;
     property user_ptrCaption:string write Set_user_ptrCaption;

     property rkey0006:integer write Set_rkey0006;
     property rkey0039:integer write Set_rkey0039;
     property rkey0034:integer write Set_rkey0034;
     property reprkey0034:integer write Set_reprkey0034;
     property flow_no:integer write Set_flow_no;
     property step:integer write Set_step;
     property qty_org_rej:integer write Set_qty_org_rej;
     property rkey0118:integer write Set_rkey0118;
  end;

var
  frmEdit: TfrmEdit;
 const
 TmpFileDir = 'c:\tmp\';
 
implementation

uses UDM, ConstVar,shellAPI,Pick_Item_Single  ,PubFunc,common,BMListFrm;

{$R *.dfm}

{ TfrmEdit }

function TfrmEdit.Get_key0058: integer;
begin
result := vkey0058;
end;

procedure TfrmEdit.Set_EditMode(const Value: integer);
begin
 vEditMode := value;
end;

procedure TfrmEdit.Set_flow_no(const Value: integer);
begin
    vflow_no := value;
end;

procedure TfrmEdit.Set_key0058(const Value: integer);
begin
 vkey0058 := value;
end;

procedure TfrmEdit.Set_qty_org_rej(const Value: integer);
begin
vqty_org_rej := value;
end;

procedure TfrmEdit.Set_rkey0006(const Value: integer);
begin

end;

procedure TfrmEdit.Set_rkey0034(const Value: integer);
begin
  vrkey0034 := value;
end;

procedure TfrmEdit.Set_rkey0039(const Value: integer);
begin
  vrkey0039 := value;
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add('SELECT REJ_CODE,REJECT_DESCRIPTION from data0039 WHERE rkey = '+inttostr(vrkey0039));
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  dm.TemADOQuery.Close ;
end;

procedure TfrmEdit.Set_rkey0118(const Value: integer);
begin
 vrkey0118 := value;
end;

procedure TfrmEdit.Set_step(const Value: integer);
begin
vstep := value;
end;

procedure TfrmEdit.Set_user_ptrCaption(const Value: string);
begin
 vuser_ptrCaption := value;
end;

procedure TfrmEdit.Showcombobox1Text2(const value1, value2,
  value3: integer);
begin
end;

function TfrmEdit.ShowDATA0010_2(const VALUE: INTEGER; var VALUE1: TEdit;
  var VALUE2: TLabel): BOOLEAN;
begin
   IF DM.TemADOQuery.Active THEN dm.TemADOQuery.Close;
  DM.TemADOQuery.SQL.Clear ;
  DM.TemADOQuery.SQL.Add('select RKEY,CUST_CODE,CUSTOMER_NAME from Data0010 where rkey = ' +inttostr(vrkey0010));
  DM.TemADOQuery.Prepared ;
  DM.TemADOQuery.Open ;
  if not DM.TemADOQuery.IsEmpty then
      begin
          VALUE1.Text := DM.TemADOQuery.FieldByName('CUST_CODE').AsString ;
          VALUE2.Caption := DM.TemADOQuery.FieldByName('CUSTOMER_NAME').AsString ;
      end ;
  DM.TemADOQuery.Close ;
end;

function TfrmEdit.ShowDATA0025_2(const VALUE: INTEGER; var VALUE1: TEdit;
  var VALUE2: TLabel): BOOLEAN;
begin
  IF DM.TemADOQuery.Active THEN dm.TemADOQuery.Close;
  DM.TemADOQuery.SQL.Clear ;
  DM.TemADOQuery.SQL.Add('select RKEY,MANU_PART_NUMBER,MANU_PART_DESC,CUSTOMER_PTR from data0025 where (PARENT_PTR = 0 or PARENT_PTR is null) and rkey = ' + inttostr(vrkey0025));
  DM.TemADOQuery.Prepared ;
  DM.TemADOQuery.Open ;
  if not DM.TemADOQuery.IsEmpty then
      begin
          VALUE1.Text := DM.TemADOQuery.FieldByName('MANU_PART_NUMBER').AsString ;
          VALUE2.Caption := DM.TemADOQuery.FieldByName('MANU_PART_DESC').AsString ;
      end;
  DM.TemADOQuery.Close ;
end;

procedure TfrmEdit.BitBtn6Click(Sender: TObject);
begin
  if vsave2 > 0 then
      modalresult := mrok
  else
      modalresult := mrCancel;
end;

procedure TfrmEdit.BitBtn8Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
  s := 'select RKEY,CUST_CODE,CUSTOMER_NAME from Data0010';
  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
      InputVar.Fields := 'CUST_CODE/客户代码/200,CUSTOMER_NAME/客户名称/200';
      InputVar.Sqlstr := s ;
      InputVar.AdoConn := DM.con1 ;
      frmPick_Item_Single2.InitForm_New(InputVar)  ;
      if frmPick_Item_Single2.ShowModal = mrok then
          begin
              if frmPick_Item_Single2.adsPick.IsEmpty then exit;
              Edit13.Text := frmPick_Item_Single2.adsPick.fieldbyname('CUST_CODE').asstring;
              Label20.Caption := frmPick_Item_Single2.adsPick.fieldbyname('CUSTOMER_NAME').asstring;
              vrkey0010 := frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;
          end
      else
          Edit13.SetFocus ;
  finally
      frmPick_Item_Single2.adsPick.Close;
      frmPick_Item_Single2.Free ;
  end;
end;

procedure TfrmEdit.Edit13Exit(Sender: TObject);
var
  s : string;
begin
  if self.Activecontrol=BitBtn8 then exit;
  if self.Activecontrol=BitBtn6 then exit;
  if trim(Edit13.Text) = '' then exit ;
  s := 'select RKEY,CUST_CODE,CUSTOMER_NAME from Data0010'
             + ' where CUST_CODE =' + '''' + trim(edit13.Text) + '''';
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add(s);
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  if dm.TemADOQuery.IsEmpty then
      begin
          messagedlg('客户代号错误！',mtinformation,[mbok],0);
          Edit13.SetFocus ;
      end
  else
      begin
          Edit13.Text := dm.TemADOQuery.fieldbyname('CUST_CODE').asstring;
          Label20.Caption := dm.TemADOQuery.fieldbyname('CUSTOMER_NAME').asstring;
          vrkey0010 := dm.TemADOQuery.fieldbyname('rkey').AsInteger ;
      end;
  dm.TemADOQuery.Close ;
end;

procedure TfrmEdit.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
  s:string;
  frmPick_Item_Single2 :TfrmPick_Item_Single;
begin
   s := 'select RKEY,MANU_PART_NUMBER,MANU_PART_DESC,CUSTOMER_PTR from data0025 where (PARENT_PTR = 0 or PARENT_PTR is null) ';
   if trim(edit13.Text) <> ''  then
       begin
           s := s +' and CUSTOMER_PTR = ' + inttostr(vrkey0010) ;
       end;
  frmPick_Item_Single2 := TfrmPick_Item_Single.Create(application) ;
  try
      InputVar.Fields := 'MANU_PART_NUMBER/本产编号/200,MANU_PART_DESC/客户型号/200';
      InputVar.Sqlstr := s ;
      InputVar.AdoConn := DM.con1 ;
      frmPick_Item_Single2.InitForm_New(InputVar)  ;
      if frmPick_Item_Single2.ShowModal = mrok then
          begin
              if frmPick_Item_Single2.adsPick.IsEmpty then exit;
              Edit12.Text := frmPick_Item_Single2.adsPick.fieldbyname('MANU_PART_NUMBER').asstring;
              Label19.Caption := frmPick_Item_Single2.adsPick.fieldbyname('MANU_PART_DESC').asstring;
              vrkey0025 := frmPick_Item_Single2.adsPick.fieldbyname('rkey').AsInteger ;
              if trim(edit13.Text) = ''  then
                  begin
                      vrkey0010 := frmPick_Item_Single2.adsPick.fieldbyname('CUSTOMER_PTR').AsInteger ;
                      ShowDATA0010_2(vrkey0010,Edit13,Label20);
                  end;
          end
      else
          Edit12.SetFocus ;
  finally
      frmPick_Item_Single2.adsPick.Close;
      frmPick_Item_Single2.Free ;
  end;
end;

procedure TfrmEdit.Edit12Exit(Sender: TObject);
var
  s : string;
begin
  if self.Activecontrol = BitBtn7 then exit;
  if self.Activecontrol = BitBtn6 then exit;
  if trim(Edit12.Text) = '' then exit ;
  s := 'select RKEY,MANU_PART_NUMBER,MANU_PART_DESC,CUSTOMER_PTR from data0025 where PARENT_PTR = 0 or PARENT_PTR is null'
             + ' and MANU_PART_NUMBER =' + '''' + trim(Edit12.Text) + '''';
  if trim(edit13.Text) <>''  then
      begin
          s := s + ' and CUSTOMER_PTR = ' + inttostr(vrkey0010) ;
      end;
  if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
  dm.TemADOQuery.SQL.Clear ;
  dm.TemADOQuery.SQL.Add(s);
  dm.TemADOQuery.Prepared ;
  dm.TemADOQuery.Open ;
  if dm.TemADOQuery.IsEmpty then
      begin
          messagedlg('本厂编号错误！',mtinformation,[mbok],0);
          Edit12.SetFocus ;
      end
  else
      begin
          Edit12.Text := dm.TemADOQuery.fieldbyname('MANU_PART_NUMBER').asstring;
          Label19.Caption := dm.TemADOQuery.fieldbyname('MANU_PART_DESC').asstring;

          vrkey0025 := dm.TemADOQuery.fieldbyname('rkey').AsInteger ;
          if vrkey0010 <> dm.TemADOQuery.fieldbyname('CUSTOMER_PTR').AsInteger then
              begin
                  vrkey0010 := dm.TemADOQuery.fieldbyname('CUSTOMER_PTR').AsInteger ;
                  ShowDATA0010_2(vrkey0010,Edit13,Label20);
              end;
      end;
  dm.TemADOQuery.Close ;
end;

procedure TfrmEdit.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
      abort;
end;

procedure TfrmEdit.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'UNIT_CODE/单位代码/100,UNIT_NAME/单位名称/200';
    InputVar.Sqlstr := 'select RKEY,UNIT_CODE,UNIT_NAME from data0002 '+
                       'order by UNIT_CODE';
    InputVar.AdoConn := DM.con1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      edit1.Text:= frmPick_Item_Single.adsPick.FieldValues['UNIT_CODE'];
      Edit1.Tag:= frmPick_Item_Single.adsPick.FieldValues['RKEY'];
     end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmEdit.N30Click(Sender: TObject);
var i:integer;
    s:string;
    fs: TMemoryStream;  
begin
  OpenDialog1.DefaultExt :='*.*';
  OpenDialog1.Filter :='';
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if  OpenDialog1.FileName[i]<>'\' then
         s:=OpenDialog1.FileName[i]+s
      else
         break;
    end;
    fs := TMemoryStream.Create;
    fs.LoadFromFile(OpenDialog1.FileName);
    if fs.Size>10*1024*1024 then
    begin
      showmessage('文件大小不能超过10M,请重新整理文件再保存...');
      fs.Free;
      exit;
    end;

    PackStream(fs);
    dm.ADO148.Append;
    dm.ADO148rec_no.Value:=dm.ado148.RecordCount;
    if vEditMode=1 then
     dm.ADO148SOURCE_PTR.Value:=Frkey101
    else
    dm.ADO148SOURCE_PTR.Value:=0;
    dm.ADO148file_name.Value:=s;
    dm.ADO148in_date.Value:=getsystem_date(dm.TemADOQuery1,1);
    dm.ADO148.Post;
    file_name.Add(OpenDialog1.FileName+';'+'0');
    fs.Free;
  end;
end;

procedure TfrmEdit.N31Click(Sender: TObject);
var
 step_number:word;
begin
if Msg_Dlg_Ask('您确定要删除该记录吗?','提示信息',1) then
 begin
  file_name.Delete(dm.ADO148rec_no.Value);
  if dm.ADO148.RecNo=dm.ado148.RecordCount then
   dm.ado148.Delete
  else
   begin
    dm.ADO148.Delete;
    step_number := dm.ADO148.RecNo;
    while not dm.ADO148.Eof do
     begin
      dm.ADO148.Edit;
      dm.ADO148rec_no.Value:=dm.ADO148rec_no.Value-1;
      dm.ADO148.Post;
      dm.ADO148.Next;
     end;
    dm.ADO148.MoveBy(step_number-dm.ADO148.RecNo);
   end;
 end;
end;

procedure TfrmEdit.N32Click(Sender: TObject);
var
 str:string;
begin
 str:=dm.ADO148remark.Value;
 if inputquery('编辑备注','文件备注说明:       ',str) then
 begin
  dm.ADO148.Edit;
  dm.ADO148remark.Value:=str;
  dm.ADO148.Post;
 end;
end;

procedure TfrmEdit.N33Click(Sender: TObject);
var
 filename,f:string;
 fs: TMemoryStream;
begin
if copy(file_name.Strings[dm.ado148rec_no.value],
        pos(';',file_name.Strings[dm.ADO148rec_no.value])+1,1)='1' then
  begin
    DM.TemADOQuery1.Close;
    DM.TemADOQuery1.SQL.Text:='select vcut_bmp FROM Data0148 where rkey='+dm.ADO148rkey.AsString;
    DM.TemADOQuery1.Open;
    if dm.TemADOQuery1.fieldbyname('vcut_bmp').IsNull then
    begin
      showmessage('此文档为空...');
      exit;
    end;
    fs := TMemoryStream.Create;
    TBlobfield(dm.TemADOQuery1.fieldbyname('vcut_bmp')).SaveToStream(fs);
    UnPackStream(fs);
    if not DirectoryExists(TmpFileDir) then
      if not CreateDir(TmpFileDir) then
        raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
    f:=TmpFileDir+dm.ado148file_name.AsString;
    fs.SaveToFile(f);
    fs.Free;
    ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
  end
  else
   begin
    filename:= copy(file_name.Strings[dm.ADO148rec_no.value],1,
                     pos(';',file_name.Strings[dm.ADO148rec_no.value])-1);
    ShellExecute(self.Handle,nil,pchar(filename),nil,nil,SW_SHOWNORMAL);
   end;
end;

//保存
procedure TfrmEdit.BitBtn5Click(Sender: TObject);
var
  vstp :integer;
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime;
begin
  if trim(Edit14.Text) = '' then
      begin
          messagedlg('投诉编号不能为空,请输入!',mtinformation,[mbOk],0);
          Edit14.Setfocus;
          exit;
      end;
  if trim(ComboBox2.Text) = '' then
      begin
          messagedlg('请输入投诉级别!',mtinformation,[mbOk],0);
          ComboBox2.Setfocus;
          exit;
      end;
  if trim(Edit13.Text)='' then
      begin
          messagedlg('请输入客户!',mtinformation,[mbOk],0);
          Edit13.Setfocus;
          exit;
      end;
  if trim(Edit12.Text)='' then
      begin
          messagedlg('请输入本厂编号!',mtinformation,[mbOk],0);
          Edit12.Setfocus;
          exit;
      end;
  if trim(Edit15.Text) = '' then
      begin
          messagedlg('请输入数量!',mtinformation,[mbOk],0);
          Edit15.Setfocus;
          exit;
      end;
  if trim(Edit1.Text) = '' then
      begin
          messagedlg('请选择一个数量单位!',mtinformation,[mbOk],0);
          BitBtn1.Setfocus;
          exit;
      end;
  if trim(Memo4.Text) = '' then
      begin
          messagedlg('请输入投诉内容!',mtinformation,[mbOk],0);
          Memo4.Setfocus;
          exit;
      end;
  if trim(Edit3.Text)='' then
      begin
          messagedlg('请输入主要缺陷!',mtinformation,[mbOk],0);
          Edit3.Setfocus;
          exit;
      end;
  if trim(Edit4.Text)='' then
      begin
          messagedlg('请输入产品周期!',mtinformation,[mbOk],0);
          Edit4.Setfocus;
          exit;
      end;
  dm.Get_ServerDatetime(valDateTime, valDate,valdt,valymd);
  if VEditMode = 0 then
      begin
          dm.ADOQ0101.Append ;
          dm.ADOQ0101CSI_USER_PTR.AsString := vuser_ptrCaption ;
          dm.ADOQ0101LOG_DATE.AsDateTime := valymd ;
      end
  else if VEditMode = 1 then
  begin
      dm.ADOQ0101.Edit;
  end;
  dm.ADOQ0101LOG_NUMBER.AsString := edit14.Text;
  dm.ADOQ0101CUSTOMER_PART_PTR.AsInteger := vrkey0025 ;
  dm.ADOQ0101CUSTOMER_PTR.AsInteger := vrkey0010 ;
  dm.ADOQ0101SHIP_DATE.AsDateTime := DateTimePicker1.Date ;
  dm.ADOQ0101QTY.AsString := Edit15.Text;
  dm.ADOQ0101EFFECT_TP.AsString := ComboBox2.Text;
  dm.ADOQ0101defect_main.AsString := Edit3.Text;
  dm.ADOQ0101content.AsString := memo4.Text;
  dm.ADOQ0101CYCLES.Value:=Edit4.Text;
  DM.ADOQ0101UNIT_PTR.Value:=Edit1.Tag;
  DM.ADOQ0101CType.Value:=1;
  dm.ADOQ0101CSI_USER_PTR.value := strtoint(user_ptr);

  dm.con1.BeginTrans ;
  try
      dm.ADOQ0101.UpdateBatch();
      dm.ADOQ0118.First ;
      while not dm.ADOQ0118.Eof do
          begin
               if dm.ADOQ0118SOURCE_PTR.IsNull then
                   begin
                       dm.ADOQ0118.Edit ;
                       dm.ADOQ0118SOURCE_PTR.AsInteger := dm.ADOQ0101rkey.AsInteger ;
                   end ;
               dm.ADOQ0118.Next ;
          end ;
      dm.ADOQ0118.UpdateBatch();
      dm.ADO148.First ;
      while not dm.ADO148.Eof do
          begin
               if dm.ADO148SOURCE_PTR.Value=0 then
                   begin
                       dm.ADO148.Edit ;
                       dm.ADO148SOURCE_PTR.AsInteger := dm.ADOQ0101rkey.AsInteger ;
                   end ;
               dm.ADO148.Next ;
          end ;
      update_filename;
      if VEditMode = 0 then
          begin
              if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
              dm.TemADOQuery.SQL.Clear ;
              dm.TemADOQuery.SQL.Add('update data0004 set seed_value = ''' + trim(edit14.Text) + ''' WHERE data0004.rkey = 2 ');
              dm.TemADOQuery.Prepared ;
              dm.TemADOQuery.ExecSQL  ;
          end;
      dm.con1.CommitTrans ;
      modalresult := mrok ;
  except
      on E: Exception do
          begin
              dm.con1.RollbackTrans ;
              MessageDlg(E.Message,mtError, [mbOk], 0);
          end;
  end;
end;

procedure TfrmEdit.FormCreate(Sender: TObject);
begin
 file_name:=tstringlist.Create;
end;

procedure TfrmEdit.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
      begin
          key:=#0;
          perform(wm_nextdlgctl,0,0);{移动到下一个控件}
      end;
end;

procedure TfrmEdit.FormShow(Sender: TObject);
var
  valDateTime, valDate,valdt: string ;
  valymd:tdatetime ;
begin
  vsave2 := 0 ;
  if vEditMode = 0 then
      begin
          if dm.TemADOQuery.Active then dm.TemADOQuery.Close ;
          dm.TemADOQuery.SQL.Clear ;
          dm.TemADOQuery.SQL.Add('SELECT seed_value from data0004 WHERE data0004.rkey = 2 ');
          dm.TemADOQuery.Prepared ;
          dm.TemADOQuery.Open ;
          edit14.Text := dm.Get_Data0004 ;
          dm.TemADOQuery.Close ;

          dm.Get_ServerDatetime(valDateTime, valDate,valdt,valymd) ;
          DateTimePicker1.Date  := strtodate(valDate) ;
      end
  else
      begin
          edit14.Text := dm.ADOQ0101LOG_NUMBER.AsString ;
          if not dm.ADOQ0101CUSTOMER_PART_PTR.IsNull then
              begin
                  vrkey0025 := dm.ADOQ0101CUSTOMER_PART_PTR.AsInteger ;
                  ShowDATA0025_2(dm.ADOQ0101CUSTOMER_PART_PTR.AsInteger,Edit12,Label19);
              end;
          if not dm.ADOQ0101CUSTOMER_PTR.IsNull then
              begin
                  vrkey0010 := dm.ADOQ0101CUSTOMER_PTR.AsInteger ;
                  ShowDATA0010_2(dm.ADOQ0101CUSTOMER_PTR.AsInteger,Edit13,Label20);
              end ;
          if not dm.ADOQ0101SHIP_DATE.IsNull then
              DateTimePicker1.Date := dm.ADOQ0101SHIP_DATE.AsDateTime ;
          Edit15.Text := dm.ADOQ0101QTY.AsString ;
          ComboBox2.Text := dm.ADOQ0101EFFECT_TP.AsString ;
          if not dm.ADOQ0101UNIT_PTR.IsNull then
          begin
            with DM.TemADOQuery1 do
            begin
              Close;
              sql.Clear;
              SQL.Add('select * from data0002 where rkey='+dm.ADOQ0101UNIT_PTR.AsString);
              Open;
            end;
            Edit1.Text:=dm.TemADOQuery1.FieldValues['unit_name'];
            Edit1.Tag:=DM.ADOQ0101UNIT_PTR.Value;
          end;
          Edit3.Text := dm.ADOQ0101DEFECT_MAIN.AsString ;
          Edit4.Text := dm.ADOQ0101CYCLES.AsString;
          memo4.Text := dm.ADOQ0101content.AsString ;
      end ;
      if vEditMode = 2 then
      begin
          BitBtn1.Enabled := False;
          BitBtn5.Enabled := false ;
          Edit14.ReadOnly := true ;
          Edit13.ReadOnly := true ;
          BitBtn8.Enabled := false ;
          Edit12.ReadOnly := true ;
          BitBtn7.Enabled := false ;
          DateTimePicker1.Enabled := false ;
          Edit15.ReadOnly := true ;
          ComboBox2.Enabled := false ;
          Memo4.ReadOnly := true ;
          DBGridEh1.ReadOnly := true ;
          n1.Enabled := true ;
          n2.Enabled := true ;
          Edit4.ReadOnly:=True;
          Edit3.ReadOnly:=True;
      end ;
end;

procedure TfrmEdit.Set_reprkey0034(const Value: integer);
var
 M: TMemoryStream;
 filename:string;
begin
  dm.ado148.UpdateBatch(arAll);
  M:=TMemoryStream.Create;
  dm.ADO148.First;
  while not dm.ADO148.Eof do
  begin
   if copy(file_name.Strings[dm.ADO148rec_no.value],
           pos(';',file_name.Strings[dm.ADO148rec_no.value])+1,
           1)='0' then
    begin
      M.Clear;
      filename:= copy(file_name.Strings[dm.ADO148rec_no.value],1,
                     pos(';',file_name.Strings[dm.ADO148rec_no.value])-1);
      M.LoadFromFile(filename);
      PackStream(M);
      dm.TemADOQuery1.Close;
      dm.TemADOQuery1.SQL.text:='update data0148 set vcut_bmp=:F where rec_no='+dm.ADO148rec_no.AsString+
                         ' and SOURCE_PTR='+dm.ADO148SOURCE_PTR.AsString;
      dm.TemADOQuery1.Parameters[0].LoadFromStream(M,ftblob);
      dm.TemADOQuery1.ExecSQL;
    end;
   dm.ADO148.next;
  end;
  M.Free;
end;

procedure TfrmEdit.update_filename;
var
 M: TMemoryStream;
 filename:string;
begin
  dm.ado148.UpdateBatch(arAll);
  M:=TMemoryStream.Create;
  dm.ADO148.First;
  while not dm.ADO148.Eof do
  begin
   if copy(file_name.Strings[dm.ADO148rec_no.value],
           pos(';',file_name.Strings[dm.ADO148rec_no.value])+1,
           1)='0' then
    begin
      M.Clear;
      filename:= copy(file_name.Strings[dm.ADO148rec_no.value],1,
                     pos(';',file_name.Strings[dm.ADO148rec_no.value])-1);
      M.LoadFromFile(filename);
      PackStream(M);
      dm.TemADOQuery1.Close;
      dm.TemADOQuery1.SQL.text:='update data0148 set vcut_bmp=:F where rec_no='+dm.ADO148rec_no.AsString+
                         ' and SOURCE_PTR='+dm.ADO148SOURCE_PTR.AsString;
      dm.TemADOQuery1.Parameters[0].LoadFromStream(M,ftblob);
      dm.TemADOQuery1.ExecSQL;
    end;
   dm.ADO148.next;
  end;
  M.Free;

end;

procedure TfrmEdit.PopupMenu2Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
 N31.Enabled:=not DM.ADO148.IsEmpty;
  N32.Enabled:=not DM.ADO148.IsEmpty;
  N33.Enabled:=not DM.ADO148.IsEmpty;
end;

procedure TfrmEdit.N2Click(Sender: TObject);
begin
 if DM.ADOQ0118.IsEmpty then exit;
 dm.ADOQ0118.Delete;
end;

procedure TfrmEdit.N1Click(Sender: TObject);
var
  LFrm: TfrmBMList;
  i:integer;
begin
//        if trim(Edit12.Text)='' then
//        begin
//          messagedlg('请先确定本厂编号！',mtinformation,[mbok],0);
//          Exit;
//          Edit12.SetFocus ;
//        end;
//        LFrm := TfrmBMList.Create(Self);
//        LFrm.FRkey25 := IntToStr(vrkey0025);
//        LFrm.rg1Click(LFrm.rg1);
//        try
//          if LFrm.ShowModal = mrOK then
//          begin
//            if not LFrm.adsBMList.IsEmpty then
//            begin
//              dm.ADOQ0118.Append;
//              if not dm.ADOQ0101rkey.IsNull then
//              dm.ADOQ0118SOURCE_PTR.AsInteger := dm.ADOQ0101rkey.AsInteger;
//              dm.ADOQ0118RESP_DEPT_PTR.asinteger:=dm.ADOQ0118.FieldByName('RESP_DEPT_PTR').asinteger;
//              dm.ADOQ0118FLAG.AsBoolean := true;
//              dm.ADOQ0118qty.AsInteger := 0 ;
//            end;
//          end;
//        finally
//          LFrm.Free;
//        end;

        if trim(Edit12.Text)='' then
        begin
          messagedlg('请先确定本厂编号！',mtinformation,[mbok],0);
          Exit;
          Edit12.SetFocus ;
        end;
        LFrm := TfrmBMList.Create(Self);
        LFrm.FRkey25 := IntToStr(vrkey0025);
        LFrm.rg1Click(LFrm.rg1);
        try
          if LFrm.ShowModal = mrOK then
          begin
            if not LFrm.adsBMList.IsEmpty then
            begin
              dm.ADOQ0118.Append;
              if not dm.ADOQ0101rkey.IsNull then
              dm.ADOQ0118SOURCE_PTR.AsInteger := dm.ADOQ0101rkey.AsInteger;
              dm.ADOQ0118RESP_DEPT_PTR.AsInteger := LFrm.adsBMList.fieldbyname('rkey').AsInteger;
              dm.ADOQ0118FLAG.AsBoolean := true;
              dm.ADOQ0118qty.AsInteger := 0 ;
            end;
          end;
        finally
          LFrm.Free;
        end;


end;

end.
