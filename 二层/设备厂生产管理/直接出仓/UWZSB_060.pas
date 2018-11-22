unit UWZSB_060;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh,DB, ADODB,
  ppCtrls, ppPrnabl, ppClass, ppBands, ppDB, ppCache, ppEndUsr, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    DBGridEh2: TDBGridEh;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox6: TCheckBox;
    Label2: TLabel;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn6: TBitBtn;
    N8: TMenuItem;
    N9: TMenuItem;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppDBPipeline2: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape1: TppShape;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
      PreColumn: TColumnEh;
      field_name:string;
      sSql :string;
      procedure init;
      procedure item_click(sender:TObject);
    { Private declarations }
  public
  sys_sortdate,sys_longdate:tdatetime;
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses common, UDM,DateUtils, UENC, UQuery, URep;

{$R *.dfm}

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
    exit;
  end;

  Caption := application.Title;
  {DM.ADOConnection1.ConnectionString := 'Provider=SQLOLEDB.1;Password=AE4FA9856F95263;Persist Security Info=True; '
    + 'User ID=HrMaintain;Initial Catalog=wisdompcb_wlg;Data Source=172.18.12.2; '
    + 'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=D018008058; '
    + 'Use Encryption for Data=False;Tag with column collation when possible=False';
  dm.ADOConnection1.Open;
  user_ptr := '3';
  vprev := '4';}
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TMain_Form.init;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from wzcp0060 where status=5');
    open;
    label2.Visible:=not dm.ADOQuery1.IsEmpty ;
  end;
  sSql:= dm.ADS60.CommandText;
  checkbox1Click(nil);
end;

procedure TMain_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
if dm.ADOConnection1.Connected then
  begin

         dm.ADS60.Close;
         dm.ADS60.Parameters.ParamByName('dtpk1').Value:=getsystem_date(dm.ADOQuery1,1)-14;
         dm.ADS60.Parameters.ParamByName('dtpk2').Value:=getsystem_date(dm.ADOQuery1,1)+1;
         dm.ads60.Open;
         dm.ADS63.Open;
  DBGridEh1TitleClick(PreColumn);
  for i:=1 to DBGridEh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

    if DBGridEh1.Columns[i-1].Visible then
        item.Checked := true ;
        item.OnClick := item_click ;
        PopupMenu1.Items.Add(item) ;
   end;
 end;
end;

procedure TMain_Form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;

procedure TMain_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
if column.Title.SortMarker =smDownEh then
begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS60.IndexFieldNames:=Column.FieldName;
end
else
begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS60.IndexFieldNames:=Column.FieldName+' DESC';
end;

if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
 begin
    label1.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
      edit1.SetFocus;
end;



procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  if dm.ADS60.IsEmpty then exit;
  i := dm.ADS60rkey.AsInteger ;
  dm.ADS60.Close;
  dm.ADS60.Open;
  dm.ADS60.Locate('rkey',i,[]);
  with dm.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey from wzcp0060 where status=5');
    open;
    label2.Visible:=not dm.ADOQuery1.IsEmpty ;
  end;
end;

procedure TMain_Form.BitBtn2Click(Sender: TObject);
begin
if DBGridEh1.DataSource.DataSet.Active then
              if DBGridEh1.DataSource.DataSet.RecordCount > 0 then
                  Export_dbGridEH_to_Excel(DBGridEh1,'直接出仓') ;

end;

procedure TMain_Form.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
begin
 if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TMain_Form.CheckBox1Click(Sender: TObject);
begin
 dm.ads60.Close;
if not checkbox1.Checked then
 dm.ads60.Parameters[0].Value:=1
else
 dm.ads60.Parameters[0].Value:=0;
if not checkbox2.Checked then
 dm.ads60.Parameters[1].Value:=2
else
 dm.ads60.Parameters[1].Value:=0;
if not checkbox3.Checked then
 dm.ads60.Parameters[2].Value:=3
else
 dm.ads60.Parameters[2].Value:=0;
if not checkbox4.Checked then
 dm.ads60.Parameters[3].Value:=4
else
 dm.ads60.Parameters[3].Value:=0;
if not checkbox6.Checked then
 dm.ads60.Parameters[4].Value:=5
else
 dm.ads60.Parameters[4].Value:=0;
 DM.ads60.open;
end;


procedure TMain_Form.N1Click(Sender: TObject);
begin

 if dm.ExistInventory(self.Handle) then  //正在盘点
  Abort;

 if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限，不能做其他操作',1)
 else
 begin
  NEC_Form:=tNEC_Form.Create(application);
  if NEC_Form.ShowModal=mrok then
  begin
    dm.ADS60.Close;
    dm.ADS60.Open;
    dm.ADS60.Locate('rkey',dm.ADSSB60rkey.Value,[]);
    dm.ADSSB60.Close;
  end;
  NEC_Form.Free;
 end;
 //BitBtn3Click(Sender);
end;

procedure TMain_Form.PopupMenu2Popup(Sender: TObject);
begin
  if DM.ADS60.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //提交
    n5.Enabled:=false;    //取消
    n7.Enabled:=false;    //删除
    n9.Enabled:=false;    //打印
  end
  else
  begin
    n2.Enabled:=(dm.ADS60status.AsInteger in [1,5]) ;   //编辑
    n3.Enabled := true;                                 //检查
    n4.Enabled := (dm.ADS60status.AsInteger in [1]) ;   //提交
    n5.Enabled:= (dm.ADS60status.AsInteger in [2]) ;    //取消
    n7.Enabled:=(dm.ADS60status.AsInteger in [1,5]) ;   //删除
    n9.Enabled:=(dm.ADS60status.AsInteger in [1,5]) ;   //打印

  end;
end;

procedure TMain_Form.Label2Click(Sender: TObject);
begin
if label2.Visible = true then
  begin
    checkbox6.Checked := true;
    BitBtn3Click(Sender);
  end;
end;

procedure TMain_Form.N2Click(Sender: TObject);
begin
 if dm.ExistInventory(self.Handle) then  //正在盘点
  Abort;

if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限，不能做其他操作',1)
 else
begin
  NEC_Form:=tNEC_Form.Create(application);
  NEC_Form.flag_Lb.Caption:='1';//代表新增
  if NEC_Form.ShowModal=mrok then
    begin
      dm.ADS60.Close;
      dm.ADS60.Open;
      dm.ADSSB60.Open;
      dm.ADS60.Locate('rkey',dm.ADSSB60rkey.Value,[]);
      dm.ADSSB60.Close;
    end;
    NEC_Form.Free;
  end;
//  BitBtn3Click(Sender);
end;

procedure TMain_Form.N3Click(Sender: TObject);
begin
NEC_Form:=TNEC_Form.Create(application);
NEC_Form.flag_Lb.Caption:='2';//代表新增
NEC_Form.BtnSave.Enabled:=false;
NEC_Form.MaskEdit1.readonly:=true;
NEC_Form.SGrid1.PopupMenu:=nil;
if NEC_Form.ShowModal=mrok then
 begin

 end;
NEC_Form.Free;
BitBtn3Click(Sender);
end;

procedure TMain_Form.N4Click(Sender: TObject);
 begin
if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限，不能做其他操作',1)
 else
begin
   dm.ADSSB60.Close;
   dm.ADSSB60.Parameters[0].Value:=dm.ADS60rkey.Value;
   dm.ADSSB60.Open;
   if dm.ADSSB60status.Value<>dm.ADS60status.Value then
    messagedlg('提交不成功!该记录状态已发生变化!',mtwarning,[mbcancel],0)
   else
    begin
     dm.ADSSB60.Edit;
     dm.ADSSB60status.Value:=2;
     dm.ADSSB60.Post;
     dm.ADS60.Close;
     dm.ADS60.Open;
     dm.ADS60.Locate('rkey',dm.ADSSB60rkey.Value,[]);
     dm.ADSSB60.Close;
    end;
 end;
 BitBtn3Click(Sender);
end;

procedure TMain_Form.N5Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限，不能做其他操作',1)
 else
begin
  if application.MessageBox('是否确定取消?','提示',mb_yesno)=idyes then
  begin
    dm.ADSSB60.Close;
    dm.ADSSB60.Parameters[0].Value:=dm.ADS60rkey.Value;
    dm.ADSSB60.Open;
    if dm.ADSSB60status.Value<>dm.ADS60status.Value then
        messagedlg('提交不成功!该记录状态已发生变化!',mtwarning,[mbcancel],0)
    else
    begin
        dm.ADSSB60.Edit;
        dm.ADSSB60status.Value:=1;
        dm.ADSSB60.Post;
        dm.ADS60.Close;
        dm.ADS60.Open;
        dm.ADS60.Locate('rkey',dm.ADSSB60rkey.Value,[]);
        dm.ADSSB60.Close;
      end;
    end;
  end;
BitBtn3Click(Sender);
end;

procedure TMain_Form.N7Click(Sender: TObject);
begin
if (vprev = '1') or (vprev = '3') then
    showmsg('你只有检查权限，不能做其他操作',1)
 else
begin
  if messagedlg('你确定要删除这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
  dm.ADOConnection1.BeginTrans;
  try
   dm.ADSSB60.Close;
   dm.ADSSB60.Parameters[0].Value:=dm.ADS60rkey.Value;
   dm.ADSSB60.Open;
   if dm.ADSSB60status.Value<>dm.ADS60status.Value then
    messagedlg('数据删除不成功!该记录状态已发生变化!',mtwarning,[mbcancel],0)
   else
    begin
      dm.ADSSB60.Delete;
    end;
   dm.ADOConnection1.CommitTrans;
   messagedlg('数据删除成功!',mtinformation,[mbOK],0);
   dm.ADS60.Close;
   dm.ADS60.Open;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('数据删除不成功!请与管理员联系',mtwarning,[mbcancel],0);
  end;
 end;
end;
end;

procedure TMain_Form.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 with Query_Form do
 begin
  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ads60.Parameters.ParamValues['dtpk1']));
  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ads60.Parameters.ParamValues['dtpk2']-1));
   if ShowModal=mrok then
   with dm.ads60 do
    begin
     close;
     CommandText:=self.sSql+#13;
     for i:=1 to SGrid1.RowCount-2 do
        CommandText:=dm.ads60.CommandText+SGrid1.Cells[2,i]+#13;
      Parameters.ParamValues['dtpk1']:=strtodate(
          formatdatetime('yyyy-mm-dd ',dtpk1.Date));
      Parameters.ParamValues['dtpk2']:=strtodate(
          formatdatetime('yyyy-mm-dd ',dtpk2.Date+1));
     open;
    end;
  end;
  BitBtn3Click(Sender);
end;

procedure TMain_Form.N9Click(Sender: TObject);
begin
  self.ppReport1.Reset;
  self.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'ck_outd.rtm';
  self.ppReport1.Template.LoadFromFile;

  self.ppReport1.SaveAsTemplate:=false;
  self.ppReport1.Print;
end;

procedure TMain_Form.BitBtn6Click(Sender: TObject);
begin
self.ppReport1.Reset;
self.ppReport1.Template.FileName :=
  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'ck_outd.rtm';
self.ppReport1.Template.LoadFromFile;
self.ppReport1.SaveAsTemplate:=true;
self.ppdesigner1.ShowModal;

end;

procedure TMain_Form.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

 case dm.ADS60status.value of
 1: DBGridEh1.Canvas.Font.Color := clwindowText;
 2: DBGridEh1.Canvas.Font.Color := clolive;
 3: DBGridEh1.Canvas.Font.Color := clPurple;
 5: DBGridEh1.Canvas.Font.Color := clred;
  end;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
