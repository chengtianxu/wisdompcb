unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls,
  DBGridEh, Menus;
             
type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    labelKey: TLabel;
    edtKey: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    StatusBar1: TStatusBar;
    DBGridEh1: TDBGridEh;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure BitBtn5Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure dtpStartDateChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    vColumn:TColumnEh;
    procedure DoSearch(subSql:string);
    procedure item_click(sender:TObject);
    procedure RefreshData(rKey:integer);//刷新数据
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses common,QuerySet,MyClass, DM,Detail_Edti,ConstVar;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_init_2(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
    exit;
  end;
  self.Caption :=Application.Title;

//  user_ptr:='23';
//  vprev:='4';

end;

procedure TfrmMain.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
var
  i:integer;
  MI:TMenuItem;
begin
  while PopupMenu1.Items.Count>0 do
    PopupMenu1.Items[0].free;
  for i:= 0 to DBGridEh1.Columns.Count- 1 do
  begin
    MI:=TmenuItem.Create(self);
    MI.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then
      MI.Checked:=true;
    MI.OnClick:=item_click;
    self.PopupMenu1.Items.Add(MI);
  end;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,'固定资产列表')
end;

procedure TfrmMain.BitBtn4Click(Sender: TObject);
var
  i:integer;
  sqlstr:string;
begin
  with TfrmQuerySet.Create(Application)do
  try
    if ShowModal = mrOk then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      begin
        if sgrid1.Cells[2,i]<> '' then
          Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      end;
      sqlstr:=sqlstr+' and (1=1) '; 
    end;
  finally
    free;
  end;
  DoSearch(sqlstr);
end;

procedure TfrmMain.DoSearch(subSql: string);
var
  sqlstr:widestring;
  i:integer;
begin
  if subsql='' then exit;
  sqlstr:=uppercase(dmcon.adsAssetList.CommandText);
  i:=Pos('WHERE (1=1)',sqlstr);
  if i = 0 then
  begin
    ShowMsg('SQL语句出错,请联系系统管理员',1);
    abort;
  end;
  Sqlstr:=copy(sqlstr,1,i-1);
  dmcon.adsAssetList.Close;
  dmcon.adsAssetList.CommandText := sqlstr+' WHERE (1=1) '+subsql +' ORDER BY Data0517.FASSET_CODE';
  dmcon.adsAssetList.open;
  StatusBar1.Panels[1].Text := IntToStr(dmcon.adsAssetList.RecordCount);
end;

procedure TfrmMain.item_click(sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i:=0 to DBGridEh1.Columns.Count-1 do
    if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible:=(sender as tmenuItem).Checked;
      break;
    end;
end;

procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);
var OldIndex:string;
begin
  edtKey.Text :='';
  vColumn := Column;
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) then
    Exit;

  if Column.Title.SortMarker = smDownEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else if Column.Title.SortMarker = smUpEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :='';
    Column.Title.SortMarker := smNoneEh;
  end
  else if Column.Title.SortMarker = smNoneEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end;


  if dmcon.adsAssetList.IsEmpty then abort;

  labelKey.Caption := Column.Title.Caption;
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  Label1.Visible := not edtKey.Visible;
  dtpStartDate.Visible := Label1.Visible;
  dtpEndDate.Visible := Label1.Visible;
end;

procedure TfrmMain.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
DATASET:TCustomADoDATASET;
begin
  DATASET := TCustomAdoDataSet(DBGridEh1.DataSource.DataSet);
  if not DATASET.Active then abort;
  tmpstr:= trim(edtKey.Text);
  if TmpStr='' then
    DATASET.Filtered:= false
  else
  begin
    if (vColumn.Field.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      DATASET.Filter := vColumn.Field.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end
    else if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := vColumn.Field.FieldName+'>='+TmpStr;
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end
    else if vColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := vColumn.Field.FieldName + sFilter;
      DATASET.Filtered:= true;
    end;
  end;
end;

procedure TfrmMain.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end
  else if  vColumn.Field.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure TfrmMain.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter:string;
begin
  if not dmcon.adsAssetList.Active then abort;
  TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
  TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
  if vColumn.Field.DataType in [ftDate, ftDateTime] then
  begin
    sFilter := vColumn.Field.FieldName+'>='+TmpStr1+ ' AND ' +vColumn.Field.FieldName+'<'+TmpStr2;
    dmcon.adsAssetList.Filter := sFilter;
    dmcon.adsAssetList.Filtered:= true;
  end;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  if dmcon.adsAssetList.Active then
    RefreshData(dmcon.adsAssetList.fieldbyName('rKey').AsInteger)
  else
    RefreshData(0);
end;

procedure TfrmMain.RefreshData(rKey: integer);
begin
  dmcon.adsAssetList.close;
  dmcon.adsAssetList.open;
  dmcon.adsAssetList.Locate('rKey',rKey,[]);
  StatusBar1.Panels[1].Text := IntToStr(dmcon.adsAssetList.RecordCount);
end;


procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  MyDataClass :=TMyDataClass.Create(dmcon.ADOConnection1);
  dtpStartDate.date := date;
  dtpEndDate.Date := date;
  RefreshData(0);

end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  try
    frmDetail_Edti:=TfrmDetail_Edti.Create(Application);
    frmDetail_Edti.FchgMe:=Tcomponent(Sender).tag=1;
    frmDetail_Edti.F_status := 4 ; //查看
    frmDetail_Edti.Enter(em_Browse,dmcon.adsAssetList.FieldByName('rKey').AsInteger);
    if Tcomponent(Sender).tag=1 then BitBtn3Click(nil);
  finally
    frmDetail_Edti.Free;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  try
    frmDetail_Edti:=TfrmDetail_Edti.Create(Application);
    frmDetail_Edti.F_status := 2;
    frmDetail_Edti.Enter(em_Edit,dmcon.adsAssetList.FieldByName('rKey').AsInteger);


  finally
    frmDetail_Edti.Free;
  end;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  try
    frmDetail_Edti:=TfrmDetail_Edti.Create(Application);
    frmDetail_Edti.Enter(em_Add,0);
  finally
    frmDetail_Edti.Free;
  end;
  StatusBar1.Panels[1].Text := IntToStr(dmcon.adsAssetList.RecordCount);
end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
var
  sqlstr:string;
begin
  if dmcon.adsAssetList.IsEmpty then
  begin
    n1.Enabled :=true;
    n2.Enabled :=false;
    n3.Enabled :=false;
    n4.Enabled :=false;
    n6.Enabled :=false;
    exit;
  end;
  sqlstr:=' SELECT top 1 Data0528.D0517_ptr, data0327.fasset_ptr'+#13 +
          ' FROM Data0517 LEFT OUTER JOIN'+#13 +
          ' data0327 ON Data0517.RKEY = data0327.fasset_ptr LEFT OUTER JOIN'+#13 +
          ' Data0528 ON Data0517.RKEY = Data0528.D0517_ptr'+#13 +
          ' WHERE (Data0517.rkey ='+dmcon.adsAssetList.fieldByName('rKey').AsString+')';
  MyDataClass.OpenQuery(dmcon.qryTmp,sqlstr);
 if (dmcon.qryTmp.FieldByName('D0517_ptr').AsVariant<>null) or
    (dmcon.qryTmp.FieldByName('fasset_ptr').AsVariant<>null) or
    (dmcon.adsAssetList.FieldByName('active_flag').Asboolean=false) then
  begin
   n2.Enabled :=false;
   n3.Enabled :=false;
  end
 else
  begin
   n2.Enabled :=true;
   n3.Enabled :=true;
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
var
  rkey,rkey417f : integer;
begin
  if not Msg_Dlg_Ask('确定删除固定资产吗?','提示',1) then exit;
  rKey:=dmcon.adsAssetList.FieldByName('rKey').Asinteger;
  rkey417f :=  dmcon.adsAssetList.FieldByName('faccu_depr_gl_ptr').AsInteger;
  dmcon.Delete_Asset(rkey);
  //删除时改变状态 2017-3-3
  dmcon.tmp.Close;
  dmcon.tmp.SQL.Text := 'update data0417 set id_code='''',active_flag=3 from data0417'+
  ' where data0417.rkey = ' + IntToStr(rkey417f);
  dmcon.tmp.ExecSQL;
  
  refreshData(rKey);
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  try
    frmDetail_Edti:=TfrmDetail_Edti.Create(Application);
    frmDetail_Edti.FchgMe:=Tcomponent(Sender).tag=1;
    frmDetail_Edti.F_status := 6 ; //修改
    frmDetail_Edti.Enter(em_Browse,dmcon.adsAssetList.FieldByName('rKey').AsInteger);
    if Tcomponent(Sender).tag=1 then BitBtn3Click(nil);
  finally
    frmDetail_Edti.Free;
  end;
end;

end.
