unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ADODB,
  ppEndUsr, ppReport, ppSubRpt, ppBands, ppStrtch, ppMemo, ppCtrls,
  ppPrnabl, ppClass, ppCache, ppProd, ppComm, ppRelatv, ppDB, ppDBPipe;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;                      
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    BitBtn6: TBitBtn;
    ppDB60: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    N6: TMenuItem;
    N8: TMenuItem;
    ppTitleBand1: TppTitleBand;
    ppDBText8: TppDBText;
    ppLabel1: TppLabel;
    ppDBText9: TppDBText;
    ppLabel2: TppLabel;
    ppDBText10: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine7: TppLine;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine12: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel15: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel17: TppLabel;
    ppLine6: TppLine;
    ppLine11: TppLine;
    ppDBText6: TppDBText;
    ppDBText14: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine2: TppLine;
    ppLine5: TppLine;
    ppDB63: TppDBPipeline;
    ppDBImage1: TppDBImage;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDBText19: TppDBText;
    ppLabel25: TppLabel;
    ppDBText20: TppDBText;
    pd493: TppDBPipeline;
    ppLabel6: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel26: TppLabel;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel3: TppLabel;
    ppLine4: TppLine;
    ppDBText16: TppDBText;
    ppLine13: TppLine;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck,FsSearch:string;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;


//  dm.ADOCon.Open;
//  user_ptr := '3';
//  vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
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

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO60.IsEmpty then exit;
  i := DM.ADO60rkey.AsInteger ;
  DM.ADO60.Close;
  DM.ADO60.Open;
  DM.ADO60.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO60.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO60.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADO60AfterScroll(DM.ADO60);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  sSql:=DM.ADO60.SQL.Text;
  FsSearch:=' where wzcp0060.type=1 and wzcp0060.sales_date>getdate()-14 ';
  CheckBox1Click(nil);
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO60status.Value = 5 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO60status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO60status.Value = 1 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO60status.Value = 3 then
     Grd1.Canvas.Font.Color := clGreen ;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADO60.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //提交
    n5.Enabled:=false;    //删除
    n9.Enabled:=false;    //cancel
    N8.Enabled:=false;    //prt
  end
  else
  begin
    n2.Enabled:=(dm.ADO60status.AsInteger in [1,5]) ;
    n3.Enabled := true;
    n4.Enabled := dm.ADO60status.AsInteger=1;
    n5.Enabled:=(dm.ADO60status.AsInteger in [1,5]) ;
    n9.Enabled:=dm.ADO60status.AsInteger=2;
    N8.Enabled:=dm.ADO60status.AsInteger=3;
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    FsSearch:=' where wzcp0060.type=1 and wzcp0060.sales_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and wzcp0060.sales_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    CheckBox1Click(nil);
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO60.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4,11,12]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

 if (Tmenuitem(Sender).Tag in [0,1]) and (dm.ExistInventory(self.Handle)) then
  begin
   Abort;
  end;

  case Tmenuitem(Sender).Tag of
  0,1,2: with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO60.Close;
           DM.ADO60.Open;
           DM.ADO60.Locate('rkey',Frkey60,[]);
         end;
       finally
         free;
         DM.ADO60_1.Close;
         DM.ADO60_1.Close;
         DM.ADO71.Close;
       end;
   3:begin    //提交
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update wzcp0060 set status=2 where rkey='+DM.ADO60rkey.AsString+' and status=1' ;
       if DM.tmp.ExecSQL=0 then
         showmessage('出库单状态发生改变而未能成功提交!');
       BtBrushClick(nil);
     end;

   4: begin
        if MessageBox(Handle,'确定删除此出库单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from wzcp0060  where rkey='+DM.ADO60rkey.AsString+' and status in (1,5)';
        if DM.tmp.ExecSQL<>1 then
          showmessage('删除数据失败,出库单状态已发生变化...')
        else
          DM.ADO60.Prior;
        BtBrushClick(nil);
      end;
   11: begin
         if MessageBox(Handle,'确定取消提交此出库单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
         DM.tmp.Close;
         DM.tmp.SQL.Text:='update wzcp0060 set status=1 where rkey='+DM.ADO60rkey.AsString+' and status=2';
         if DM.tmp.ExecSQL<>1 then
           showmessage('取消提交此出库单失败,数据状态已发生变化...');
         BtBrushClick(nil);
       end;
   12:begin
        ppReport1.Reset;
        ppReport1.Template.FileName:=stringReplace(ExtractFileDir(Application.ExeName),'EXEC','NIERP\REPORT\',[rfReplaceAll])+'RepSBcp60.rtm';
        ppReport1.Template.LoadFromFile;
        ppReport1.SaveAsTemplate:=false;
        ppReport1.Print;
      end;
  end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
begin
  FsCheck:=' and wzcp0060.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  DM.ADO60.SQL.Text:=sSql+FsSearch+FsCheck+' order by wzcp0060.sales_order';
  DM.ADO60.Close;
  DM.ADO60.Open;
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    exit;
  end;                                      
  ppReport1.Reset;
  ppReport1.Template.FileName:=stringReplace(ExtractFileDir(Application.ExeName),'EXEC','NIERP\REPORT\',[rfReplaceAll])+'RepSBcp60.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.SaveAsTemplate:=true;
  ppdesigner1.ShowModal;
end;

end.
