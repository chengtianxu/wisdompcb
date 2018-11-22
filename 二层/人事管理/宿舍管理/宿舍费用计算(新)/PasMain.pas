unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,MyClass, Buttons, ExtCtrls, ComCtrls,
   Grids,DB, DBGridEh,ADODB;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnExit: TBitBtn;
    btnRefresh: TBitBtn;
    btnExport: TBitBtn;
    btnInit: TBitBtn;
    btnCalc: TBitBtn;
    pcMain: TPageControl;
    tsBedroom: TTabSheet;
    tsEmp: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    dbBedroom: TDBGridEh;
    dbAux: TDBGridEh;
    dbEmp: TDBGridEh;
    lbFilter: TLabel;
    edtFilter: TEdit;
    Label2: TLabel;
    cbbyearmonth: TComboBox;
    pnl1: TPanel;
    lbl1: TLabel;
    procedure btnExitClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInitClick(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure dbEmpTitleClick(Column: TColumnEh);
    procedure dbBedroomTitleClick(Column: TColumnEh);
    procedure pcMainChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cbbyearmonthChange(Sender: TObject);
    procedure dbBedroomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbEmpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbl1Click(Sender: TObject);
  private
    mc:TMyDataClass;
    preColumn:TColumnEh;
    procedure opends(ds1,ds2,ds3:TADODataSet);
    procedure changtitle(dbgrid:TDBGridEh;column:TColumnEh);
    procedure Lock(boolstr:Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DEMO,common,DateUtils;

{$R *.dfm}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
var
  dbgrid:TDBGridEh;
begin
  if pcMain.ActivePageIndex=0 then dbgrid:=dbBedroom
  else dbgrid:=dbEmp;
  common.Export_dbGridEH_to_Excel(dbgrid,pcMain.ActivePage.Caption);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if not App_Init(DM.ADOConnection1) then
  begin
    ShowMessage('程序启动失败，请联系管理员');
    Application.Terminate;
  end;
  frmMain.Caption:=Application.Title;
  mc:=TMyDataClass.Create(DM.ADOConnection1);

//  vprev:='4';
//  user_ptr:='3057';
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  today:TDateTime;
  i:Integer;
  tmpquery:TADOQuery;
begin
  try
    tmpquery:=TADOQuery.Create(nil);
    tmpquery.Connection:=DM.ADOConnection1;
    today:= getsystem_date(tmpquery,1);
    for i:=0 to 11 do
      cbbyearmonth.Items.Add(Copy(FormatDateTime('yyyy-MM-dd',IncMonth(today,-i)),1,7));
    cbbyearmonth.Style:=csDropDownList;
    cbbyearmonth.ItemIndex:=0;
    pcMain.ActivePageIndex:=1;
    preColumn:=dbEmp.Columns[1];

    Self.opends(dm.dsMain,DM.dsAux,DM.dsEmp);
  finally
    tmpquery.Free;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  mc.Free;
end;

procedure TfrmMain.btnInitClick(Sender: TObject);
var
  tmpstr:string;
begin
  try
    Screen.Cursor:=crHourGlass;
    Lock(False);
    tmpstr:='exec hrsp_bedroomfees_init '+ QuotedStr(Trim(cbbyearmonth.Text));
    if mc.ExecSql(tmpstr) then ShowMessage('初始化成功')
    else ShowMessage('初始化失败');
    
    Self.opends(dm.dsMain,DM.dsAux,DM.dsEmp);
  finally
    Screen.Cursor:=crDefault;
    Lock(True);
  end;
end;

procedure TfrmMain.Lock(boolstr: Boolean);
var
  i:Integer;
begin
  for i:=0 to Panel1.ControlCount-1 do
  begin
    Panel1.Controls[i].Enabled:=boolstr;
  end;
end;

procedure TfrmMain.btnCalcClick(Sender: TObject);
var
  tmpstr:string;
begin
  if DM.dsEmp.IsEmpty then
  begin
    ShowMessage('请先进行初始化');
    exit;
  end;
  try
    Screen.Cursor:=crHourGlass;
    Lock(False);
    tmpstr:='exec hrsp_bedroomfees_pro '+ QuotedStr(Trim(cbbyearmonth.Text));
    if mc.ExecSql(tmpstr) then ShowMessage('计算成功')
    else ShowMessage('计算失败');

    Self.opends(dm.dsMain,DM.dsAux,DM.dsEmp);
  finally
    Screen.Cursor:=crDefault;
    Lock(True);
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if Trim(edtFilter.Text)<>'' then
  begin
    if pcMain.ActivePageIndex=1 then
    begin
      DM.dsEmp.Filtered:=False;
      DM.dsEmp.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
      DM.dsEmp.Filtered:=True;
    end
    else
    begin
      DM.dsMain.Filtered:=False;
      DM.dsMain.Filter:=preColumn.FieldName + ' like ''%' + Trim(edtFilter.Text)+ '%''';
      DM.dsMain.Filtered:=True;
    end;
  end
  else
  begin
    DM.dsMain.Filter:='';
    DM.dsEmp.Filter:='';
  end;
end;

procedure TfrmMain.dbEmpTitleClick(Column: TColumnEh);
begin
  changtitle(dbEmp,Column);
end;

procedure TfrmMain.changtitle(dbgrid: TDBGridEh; column: TColumnEh);
begin
  if (Column.Title.Caption<>preColumn.Title.Caption) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;
end;

procedure TfrmMain.dbBedroomTitleClick(Column: TColumnEh);
begin
  changtitle(dbBedroom,Column);
end;

procedure TfrmMain.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePageIndex=0 then dbBedroomTitleClick(dbBedroom.Columns[2])
  else dbEmpTitleClick(dbEmp.Columns[1]);
  lbFilter.Caption:='房间名';
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  rkey:Integer;
begin
  if pcMain.ActivePageIndex= 0 then
  begin
    if DM.dsMainrkey.Value<>0 then
      rkey:= DM.dsMainrkey.Value;
    DM.dsMain.Close;
    DM.dsMain.Open;
    DM.dsMain.Locate('rkey',rkey,[]);
    DM.dsAux.Close;
    DM.dsAux.Open;
  end
  else
  begin
    if DM.dsEmprkey.Value<>0 then
      rkey:= DM.dsEmprkey.Value;
    DM.dsEmp.Close;
    DM.dsEmp.Open;
    DM.dsEmp.Locate('rkey',rkey,[]);
  end;
end;

procedure TfrmMain.opends(ds1, ds2, ds3: TADODataSet);
begin
  ds1.Close;
  ds1.Parameters[0].Value:=Trim(cbbyearmonth.Text);
  ds1.Open;

  ds2.Close;
  ds2.Parameters[0].Value:=Trim(cbbyearmonth.Text);
  ds2.Open;

  ds3.Close;
  ds3.Parameters[0].Value:=Trim(cbbyearmonth.Text);
  ds3.Open;
end;

procedure TfrmMain.cbbyearmonthChange(Sender: TObject);
begin
  opends(DM.dsMain,DM.dsAux,DM.dsEmp);
end;

procedure TfrmMain.dbBedroomKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.dsMain.CommandText);
end;

procedure TfrmMain.dbEmpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.dsEmp.CommandText);
end;

procedure TfrmMain.lbl1Click(Sender: TObject);
begin
  ShowMessage('夫妻房费用：水费+电费+（房间费用 - 补助总金额（夫妻双方补助））');
end;

end.
