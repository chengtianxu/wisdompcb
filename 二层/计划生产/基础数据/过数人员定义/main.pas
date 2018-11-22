//****************************************************************************//
//****                                                                    ****//
//**** Programer: Jacky Zhong                                             ****//
//**** Date: Aug. 2007                                                    ****//
//****                                                                    ****//
//****                                                                    ****//
//****************************************************************************//
unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons,DB,ADODB,
  Menus, ppComm, ppRelatv, ppDB, ppDBPipe, ppProd, ppClass, ppReport,
  ppBands, ppCache, ppCtrls, ppModule, raCodMod, ppPrnabl, ppVar, ppBarCod;

type
  TfrmMain = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    labelKey: TLabel;
    edtKey: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button1: TButton;
    BitBtn5: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel4: TppLabel;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine3: TppLine;
    ppDBText7: TppLabel;
    ppLabel2: TppLabel;
    ppDBBarCode2: TppDBBarCode;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    raCodeModule1: TraCodeModule;
    N6: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure dtpStartDateChange(Sender: TObject);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    vColumn:TColumnEh;
    procedure RefreshData(rKey:integer);//刷新数据
    procedure EnterDetail(EnterMode:byte;rKey:integer);//进入资料明细窗体
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses dm,common,MyClass,Worker_Edit,ConstVar;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin  { }
  if not App_Init(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;  
  self.Caption :=Application.Title;

 { vprev:='4';
  user_ptr:='5';
  dmcon.ADOConnection1.Open;  }
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  dmcon.adsWorkerList.Filter :='';
  if dmcon.adsWorkerList.Active then
    RefreshData(dmcon.adsWorkerList.fieldbyName('rKey').AsInteger)
  else
    RefreshData(0);
end;

procedure TfrmMain.RefreshData(rKey: integer);
begin
//  if not dmcon.adsAssetList.Active then exit;
  dmcon.adsWorkerList.close;
  dmcon.adsWorkerList.open;
  dmcon.adsWorkerList.Locate('rKey',rKey,[]);
  StatusBar1.Panels[1].Text := IntToStr(dmcon.adsWorkerList.RecordCount);
end;


procedure TfrmMain.FormShow(Sender: TObject);
begin
  MyDataClass :=TMyDataClass.Create(dmcon.ADOConnection1);
  RefreshData(0);
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
   BitBtn5.Enabled:=False
  else
   BitBtn5.Enabled:=True;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MyDataClass.Free;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,'过数人员列表')
end;

procedure TfrmMain.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter:string;
  DATASET:TCustomADODATASET;
begin
  DATASET:=TCustomADODATASET(DBGridEh1.DataSource.DataSet);
  if not DATASET.Active then abort;
  TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
  TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
  if vColumn.Field.DataType in [ftDate, ftDateTime] then
  begin
    sFilter := vColumn.FieldName+'>='+TmpStr1+ ' AND ' +vColumn.FieldName+'<'+TmpStr2;
    DATASET.Filter := sFilter;
    DATASET.Filtered:= true;
  end;
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
      DATASET.Filter := vColumn.FieldName+' Like '+ QuotedStr(sFilter);
      DATASET.Filtered:= true;
    end
    else if vColumn.Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := vColumn.FieldName+'>='+TmpStr;//DBGrid3.SelectedField.FieldName+'>='+TmpStr+' AND '+ DBGrid3.SelectedField.FieldName+'<'+IntToStr(Get_Filter_Of_Fixed_Int(StrToFloat(TmpStr)));
      DATASET.Filter := sFilter;
      DATASET.Filtered:= true;
    end
    else if vColumn.Field.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      DATASET.Filter := vColumn.FieldName + sFilter;
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
//    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
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


procedure TfrmMain.DBGridEh1CellClick(Column: TColumnEh);
begin
{  edtKey.Enabled:= not DBGRidEh1.DataSource.DataSet.IsEmpty;
  dtpStartDate.Enabled := edtKey.Enabled;
  dtpEndDate.Enabled := edtKey.Enabled;

  if DBGRidEh1.DataSource.DataSet.IsEmpty then abort;
//  SelectedField := Column.FieldName;
  labelKey.Caption := Column.Title.Caption;
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  Label1.Visible := not edtKey.Visible;
  dtpStartDate.Visible := Label1.Visible;
  dtpEndDate.Visible := Label1.Visible;}
end;

procedure TfrmMain.DBGridEh1TitleClick(Column: TColumnEh);

begin
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
  end;{end case}
  if TCustomAdoDataSet(Column.Field.DataSet).IsEmpty then abort;
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  labelKey.Caption := Column.Title.Caption;
  labelKey.Visible:= edtKey.Visible;
end;

procedure TfrmMain.N1Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbOK],0);
  end
  else
  begin
    EnterDetail(em_Add,0);
  end;
end;

procedure TfrmMain.EnterDetail(EnterMode: byte; rKey: integer);
begin
  with TfrmWorker_Edit.Create(Application) do
  try
    Enter(rKey,EnterMode);
  finally
    release;
  end;
end;

procedure TfrmMain.N2Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbOK],0);
  end
  else
  begin
    EnterDetail(em_Edit, dmcon.adsWorkerList.fieldbyName('rKey').AsInteger);
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  Pswd:string;
begin
  with dmcon do begin
    adsWorkerList.first;
    while not adsWorkerList.eof do begin
      adsWorkerList.edit;
      pswd:=Decode_Old_Pswd(dmcon.adsWorkerList.FieldByName('LOGIN_PASS').AsString);
      adsWorkerList.FieldByName('Pswd_Decode').Asstring :=pswd;
      Pswd :=Stringreplace(adsWorkerList.FieldByName('Pswd_Decode').Asstring,'*','',[rfReplaceAll]);
      adsWorkerList.FieldByName('Pswd_Decode').Asstring :=Base64_Encode(pswd);
      adsWorkerList.FieldByName('LOGIN_PASS').Asstring := adsWorkerList.FieldByName('Pswd_Decode').Asstring;
      adsWorkerList.next;
    end;
    adsWorkerList.UpdateBatch(arall);
  end;
end;

procedure TfrmMain.N3Click(Sender: TObject);
var
  rkey:integer;
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbOK],0);
  end
  else
  begin
  if dmcon.adsWorkerList.IsEmpty then exit;
  rKey:=dmcon.adsWorkerList.fieldbyName('rkey').AsInteger;
  if not Msg_Dlg_Ask('确定删除吗?','提示',1) then exit;
    if dmcon.DeleteData(rKey) then
      RefreshData(rKey)
    else
      ShowMsg('删除失败!',1);
  end;
end;

procedure TfrmMain.ppDetailBand1BeforePrint(Sender: TObject);
begin
  ppDBText7.Text := IntToStr(dmcon.adsWorkerList.recNo);
  ppLabel2.Text := dmcon.Get_Print_Dept_Desc(dmcon.adsWorkerList.fieldbyName('rKey').AsInteger);
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  {dmcon.adsWorkerList.Close;
  dmcon.adsWorkerList.CommandText:='select data0486.rkey,'+
    'data0486.EMPL_PTR, data0486.LOGIN_NAME, (rtrim(data0486.LOGIN_NAME)+''$''+rtrim(data0486.LOGIN_PASS)) LOGIN_PASS,'+
    'data0486.PRIV, data0486.Pswd_Decode, data0486.OutSource,'+
    'data0005.empl_code,data0005.employee_name,'+
    'data0034.dept_code,data0034.dept_name,data0005.tpostion,'+
    'data0005.active_flag,case data0005.active_flag when ''Y'' then ''在职'' when ''N'' then ''离职'' end as Emp_Status '+
    'from data0486,data0005,data0034 '+
    'where data0486.empl_ptr=data0005.rkey '+
    'and data0005.employee_id=data0034.rkey '+
    'order by '+
    'data0034.dept_name,data0005.empl_code';
  dmcon.adsWorkerList.Open;
  ppReport1.Reset;
  ppReport1.Template.FileName :='R:\NIERP\Report\Dept_Worker_BarCode1.rtm';
  ppReport1.Template.LoadFromFile;
  }
  ppReport1.Print;
end;

procedure TfrmMain.N5Click(Sender: TObject);
begin
  dmcon.adsWorkerList.Close;
  dmcon.adsWorkerList.CommandText:='select data0486.*,'+
    'data0005.empl_code,data0005.employee_name,'+
    'data0034.dept_code,data0034.dept_name,data0005.tpostion,'+
    'data0005.active_flag,case data0005.active_flag when ''Y'' then ''在职'' when ''N'' then ''离职'' end as Emp_Status '+
    'from data0486,data0005,data0034 '+
    'where data0486.empl_ptr=data0005.rkey '+
    'and data0005.employee_id=data0034.rkey '+
    'order by '+
    'data0034.dept_name,data0005.empl_code';
  dmcon.adsWorkerList.Open;
  ppReport1.Reset;
  ppReport1.Template.FileName :='R:\NIERP\Report\Dept_Worker_BarCode2.rtm';
  ppReport1.Template.LoadFromFile;
  ppReport1.Print;
end;

procedure TfrmMain.BitBtn5Click(Sender: TObject);
var
  p:Tpoint;
begin
  p.y := bitbtn5.Top + bitbtn5.Height;
  p.x :=bitbtn5.Left;
  p:=ClientToScreen(p);
  popupmenu2.Popup(p.X,p.y);
end;

procedure TfrmMain.N6Click(Sender: TObject);
begin
  EnterDetail(em_browse, dmcon.adsWorkerList.fieldbyName('rKey').AsInteger);
end;

end.
