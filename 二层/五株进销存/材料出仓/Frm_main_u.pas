unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB, Menus,OleServer, Excel2000, ComObj,
  ppDB, ppComm, ppRelatv, ppDBPipe, raide, ppProd,
  ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppEndUsr;
type
  TFrm_main = class(TForm)
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Grd1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    PopupMenu2: TPopupMenu;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn2: TBitBtn;
    N6: TMenuItem;
    BitBtn3: TBitBtn;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql,nSql :string;
    procedure item_click(sender:TObject);
    procedure ExcelToDB;
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses common,dm_u,Frm_QrySet_u,Frm_detail_u, delete_detail, Frm_report,
  mulreport;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
var i:integer;
    item:TmenuItem;
begin
  if not app_init(dm.ADOCon) then
  begin
    showmsg('程序起动失败,请与管理员联系!',1);
    application.Terminate;
  end;
  self.Caption:= application.Title;


  //dm.ADOCon.Open;
  //user_ptr := '4';
  //vprev := '2';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;

  for i := 1 to Grd1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := Grd1.Columns[i - 1].Title.Caption;
    item.Checked := Grd1.Columns[i - 1].Visible;
    item.OnClick := item_click;
    self.PopupMenu2.Items.Add(item);
  end;
  sSql:=DM.ADOinvt_issue.SQL.Text;
  nSql:=dm.ADOnum.SQL.Text;
  DM.ADOinvt_issue.SQL.Text:=DM.ADOinvt_issue.SQL.Text+' where TDATE>getdate()-60 order by GON_NUMBER';
  dm.ADOnum.SQL.Text:=dm.ADOnum.SQL.Text+' where TDATE>getdate()-60 order by GON_NUMBER';
  DM.ADOinvt_issue.Open;
  dm.ADOnum.Open;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADOinvt_issue.SQL.Text);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADOinvt_issue.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADOinvt_issue.Sort:=Column.FieldName+' DESC';
  end;
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.BitBtn7Click(Sender: TObject);
var
  i:integer;
begin
  if DM.ADOinvt_issue.IsEmpty then exit;
  i := DM.ADOinvt_issuerkey.AsInteger ;
  DM.ADOinvt_issue.Close;
  DM.ADOinvt_issue.Open;
  DM.ADOinvt_issue.Locate('rkey',i,[]);
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.item_click(sender: TObject);
var
  i:integer;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := true;
      break;
    end ;
  end else begin
    for i := 0 to Grd1.FieldCount - 1 do
    if Grd1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      Grd1.Columns[i].Visible := false;
      break;
    end;
  end;

end;

procedure TFrm_main.BitBtn10Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.BitBtn8Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Grd1,'材料出库');
end;

procedure TFrm_main.BitBtn9Click(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    DM.ADOinvt_issue.SQL.Text:=sSql+' where Tdate>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and Tdate-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+' order by '+field_name;
    DM.ADOinvt_issue.Open;
    DM.ADOnum.SQL.Text:=nSql+' where Tdate>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and Tdate-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr+' order by '+field_name;
    dm.ADOnum.Open;          
  end;


end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  case TMenuitem(Sender).Tag of
  0,1,3:
    with TFrm_detail.Create(nil) do
    try
      Ftag:=TMenuitem(Sender).Tag;
      if Ftag=0 then
      begin
        DM.ADOinvt_issue.Append ;
        DM.ADOinvt_issueTDATE.Value:=date;
        caption:='新增';
      end else if Ftag=1 then begin
        DM.ADOinvt_issue.Edit;
        caption:='编辑';
      end else begin
       caption:='检查';
      end;
      ShowModal;
    finally
      free;
    end;
  2:DM.ADOinvt_issue.Delete;
  end;
end;

procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  N1.Enabled:=(vprev='2') or (vprev='4');
  N2.Enabled:=N1.Enabled and not DM.ADOinvt_issue.IsEmpty;
  N3.Enabled:=N2.Enabled;
  N5.Enabled:=not DM.ADOinvt_issue.IsEmpty;
end;

procedure TFrm_main.ExcelToDB;
var
  fileName:String;
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;

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

   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     DM.ADOinvt_issue.DisableControls;
     for iCount:=2 to 65535 do
     begin
       if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then  break;
       DM.ADOinvt_issue.Append;
       for jCount:=1 to 20 do
         DM.ADOinvt_issue.Fields[jCount].Value:=sheet.cells[iCount,jCount];
       DM.ADOinvt_issue.Post;
     end;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
     DM.ADOinvt_issue.EnableControls;
   end

end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
  ExcelToDB;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(Tform3, form3);

    if form3.showmodal=mrok then
      begin
      end
    else
    form3.free;
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin
dm.ADOinvt_issue1.Close;
dm.ADOinvt_issue1.Parameters[0].Value:=dm.ADOinvt_issueGON_NUMBER.Value;
dm.ADOinvt_issue1.Open;
with treport_issue.Create(application) do
try
ppReport1.Print;
finally
free;
end;
end;
procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
report_issue:=treport_issue.Create(application);
report_issue.ppReport1.Reset;
report_issue.ppReport1.Template.FileName:=stringReplace(uppercase(getcurrentdir),'JINXIAOCUN','JINXIAOCUN\',[rfReplaceAll])+'issue.rtm';
report_issue.ppReport1.Template.LoadFromFile;
report_issue.ppReport1.SaveAsTemplate:=true;
report_issue.ppDesigner1.ShowModal;
report_issue.Free;
end;

procedure TFrm_main.N8Click(Sender: TObject);
var
i:integer;
begin
form_mulreport:=tform_mulreport.Create(application);
if form_mulreport.ShowModal=mrok then
  begin
   for i:=1 to form_mulreport.StG2.RowCount-2 do
    begin
      report_issue:=Treport_issue.Create(application);
      dm.ADOinvt_issue1.Close;
      dm.ADOinvt_issue1.Parameters[0].Value:=form_mulreport.StG2.Cells[0,i];
      dm.ADOinvt_issue1.Open;

      report_issue.ppReport1.Reset;
      report_issue.ppReport1.Template.FileName:=stringReplace(uppercase(getcurrentdir),'JINXIAOCUN','JINXIAOCUN\',[rfReplaceAll])+'issue.rtm';
      report_issue.ppReport1.Template.LoadFromFile;
      report_issue.ppReport1.SaveAsTemplate:=false;
      report_issue.ppReport1.DeviceType := 'Printer';
      report_issue.ppReport1.ShowPrintDialog :=false;
      report_issue.ppReport1.Print;
      report_issue.Free;
     end;
    end;
 form_mulreport.free;
 bitbtn7click(sender);
end;
end.
