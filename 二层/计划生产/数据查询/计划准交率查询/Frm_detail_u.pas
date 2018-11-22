unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids, common,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, ExtDlgs, DBClient, frm_subdetail_u;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Eh1: TDBGridEh;
    Chart1: TChart;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Series1: TBarSeries;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    TabSheet4: TTabSheet;
    dbgmain: TDBGridEh;
    dbgsub: TDBGridEh;
    tmp: TADOQuery;
    ds2: TDataSource;
    ytype: TComboBox;
    mds: TDataSource;
    mainqry: TADOQuery;
    sds: TDataSource;
    subads: TADODataSet;
    Panel2: TPanel;
    cb1: TCheckBox;
    cb2: TCheckBox;
    cb3: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    whcb: TComboBox;
    Panel3: TPanel;
    Label3: TLabel;
    tpcb: TComboBox;
    Label5: TLabel;
    fstr: TEdit;
    cb4: TCheckBox;
    sdtp: TDateTimePicker;
    cds: TClientDataSet;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbtypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ytypeChange(Sender: TObject);
    procedure Eh1DblClick(Sender: TObject);
    procedure mdsDataChange(Sender: TObject; Field: TField);
    procedure dbgmainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgsubKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure whcbKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Filtercheck(Sender: TObject);
    procedure dbgmainTitleClick(Column: TColumnEh);
    procedure fstrChange(Sender: TObject);
  private
    function buildfilter:string;
  public
    ttype:byte;         //分类索引
    ttype_name:string;  //分类名称
    ttype_name2:string;  //客户计划分类名称
  end;

var
  Frm_detail: TFrm_detail;

implementation

{$R *.dfm}

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
begin
  if MessageDlg('确认导出'+PageControl1.ActivePage.Caption+'数据?',  mtCustom, [mbYes, mbNo], 0) =
       mrYes then
  begin
    case PageControl1.ActivePage.Tag of
    0: if ADOQuery1.IsEmpty then
         ShowMessage(PageControl1.ActivePage.Caption+'无数据可以导出')
       else
         Export_dbGridEH_to_Excel(eh1,PageControl1.ActivePage.Caption);
    2: if tmp.IsEmpty then
         ShowMessage(PageControl1.ActivePage.Caption+'无数据可以导出')
       else
         Export_dbGridEH_to_Excel(DBGridEh1,PageControl1.ActivePage.Caption);
    3: if mainqry.IsEmpty then
         ShowMessage(PageControl1.ActivePage.Caption+'无数据可以导出')
       else
         Export_dbGridEH_to_Excel(dbgmain,PageControl1.ActivePage.Caption);
    end;
  end;
end;

procedure TFrm_detail.PageControl1Change(Sender: TObject);
begin
  SpeedButton1.Enabled:= not (pagecontrol1.ActivePageIndex=1);
  checkbox1.Enabled:= pagecontrol1.ActivePageIndex=1;
  ytype.Visible:=pagecontrol1.ActivePage.Name='TabSheet3';
  label4.Visible:=ytype.Visible;
end;

procedure TFrm_detail.SpeedButton5Click(Sender: TObject);
begin
  if PrintDialog1.Execute then   Chart1.Print;
end;

procedure TFrm_detail.SpeedButton4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    chart1.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');
end;

procedure TFrm_detail.SpeedButton6Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom<300 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TFrm_detail.SpeedButton7Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom>1 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
begin
  chart1.PreviousPage;
end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
begin
  chart1.NextPage;
end;

procedure TFrm_detail.Edit2Change(Sender: TObject);
begin
  Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TFrm_detail.CheckBox1Click(Sender: TObject);
begin
  chart1.View3D:=CheckBox1.Checked;
end;

procedure TFrm_detail.Eh1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then showmessage(adoquery1.SQL.Text);
end;

procedure TFrm_detail.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.FormShow(Sender: TObject);
var i:integer;
begin
  for i:=0 to 4 do
  begin
    eh1.Columns[i].Field:=ADOQuery1.Fields[i];
  end;
  eh1.Columns[0].Width:=80;
  eh1.Columns[1].Width:=120;
  eh1.Columns[2].Width:=90;
  eh1.Columns[2].Title.caption:= '准交率';
  eh1.Columns[3].Width:=90;
  eh1.Columns[3].Title.caption:= '准期数';
  eh1.Columns[4].Width:=90;
  eh1.Columns[4].Title.caption:= '总数';
  eh1.Columns[1].Visible:=ttype>1;
  case ttype of
  0,1,5: eh1.Columns[1].Visible:=False;
  else
       eh1.Columns[1].Visible:=True;
  end;
  case ttype of
   0:chart1.MaxPointsPerPage :=31;
   1:chart1.MaxPointsPerPage :=12;
   2:chart1.MaxPointsPerPage :=20;
   3:chart1.MaxPointsPerPage :=10;
   4:chart1.MaxPointsPerPage :=10;
   5:chart1.MaxPointsPerPage :=20;
   6:chart1.MaxPointsPerPage :=10;
  end;
  if ADOQuery1.RecordCount<chart1.MaxPointsPerPage then
  chart1.MaxPointsPerPage :=ADOQuery1.RecordCount;
  Edit2.Text:=IntToStr(chart1.MaxPointsPerPage);
  series1.Clear;
  adoquery1.DisableControls;
  while not adoquery1.Eof do
  begin
    Series1.Add(ADOQuery1.Fields[2].Value,ADOQuery1.Fields[0].AsString);
    adoquery1.Next;
  end;
  adoquery1.first;
  self.Series1.ValueFormat:='##0.##%';
  chart1.LeftAxis.Title.Caption:='比率';
  adoquery1.EnableControls;
  Tabsheet1.Caption:=ttype_name2+'-'+ttype_name+'-'+Tabsheet1.Caption;
  chart1.Title.Text.Text:='订单汇总数据对比图('+ttype_name+')';
  Tabsheet3.Caption:= '年度-'+ttype_name+'-月份汇总';
  Application.ProcessMessages;
  mainqry.Active:=True;
  
  subads.Active:=True;
    if ttype<2 then
  TabSheet3.Free;
  pagecontrol1.ActivePageIndex := 0;
  sdtp.Date:=Now;
end;

procedure TFrm_detail.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  with   (Sender as TDBGridEh).DataSource do
  begin
    if DataSet is TADODataSet then
      showmessage((DataSet as  TADODataSet).CommandText);
    if DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text);
    if DataSet is TClientDataSet then
      showmessage((DataSet as  TADOQuery).SQL.Text);
  end;
end;

procedure TFrm_detail.cbtypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key:=$0;
end;

procedure TFrm_detail.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  with   (Sender as TDBGridEh).DataSource do
  begin
    if DataSet is TADODataSet then
      showmessage((DataSet as  TADODataSet).CommandText);
    if DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text);
    if DataSet is TClientDataSet then
      showmessage((DataSet as  TADOQuery).SQL.Text);
  end;
end;

procedure TFrm_detail.ytypeChange(Sender: TObject);
var
  i:Integer;
begin
    with tmp do
    begin
      Close;
      SQL.Strings[11]:=Format('where sch_date> ''%s-01-01 0:00:00'' and sch_date< ''%s-12-31 23:59:59'' ',
      [ytype.Text,ytype.Text]);
      //ShowMessage(SQL.Text);
      Open;
      Tabsheet3.Caption:= ytype.Text+'年度-'+ttype_name+'-月份汇总';
    end;
    for i:=0 to DBGridEh1.Columns.Count-1 do
    with DBGridEh1.Columns[i] do
    case i of
    0:Width:=56;
    1:if FieldName='name' then
        Visible:=False
      else
        Width:=96;
    else
      DisplayFormat:='##0.###%';
      Width:=56;
    end;
end;

procedure TFrm_detail.Eh1DblClick(Sender: TObject);
var
  p1:Integer;
begin
  with Tfrm_subdetail.Create(Application) do
  begin
    Caption:=ttype_name+'-'+ ADOQuery1.Fields[0].AsString+'订单交期数据明细';
    qry.Connection:=tmp.Connection;
    qry.Parameters.ParamByName('bd').Value:=ADOQuery1.Parameters.ParamByName('p1').Value;
    qry.Parameters.ParamByName('ed').Value:=ADOQuery1.Parameters.ParamByName('p2').Value;
    p1:=Pos('WHere',ADOQuery1.SQL.Text)+5;
    qry.SQL.Add(' where '+Copy(ADOQuery1.SQL.Text,p1,Pos('GROUP',ADOQuery1.SQL.Text)-p1));
    with qry do
    case ttype of
    0: SQL.Add(Format(' and d360.sch_date = ''%s'' ' , [ADOQuery1.Fields.Fields[0].AsString]));
    1: SQL.Add(Format(' and datepart(yy,d360.SCH_DATE)*100+datepart(mm,d360.SCH_DATE) = %d ' , [ADOQuery1.Fields.Fields[0].AsInteger]));
    2: SQL.Add(Format(' and data0007.pr_grp_code = ''%s'' ' , [ADOQuery1.Fields.Fields[0].AsString]));
    3: SQL.Add(Format(' and data0005.EMPL_CODE = ''%s'' ' , [ADOQuery1.Fields.Fields[0].AsString]));
    4: SQL.Add(Format(' and Data0008.PROD_CODE = ''%s'' ' , [ADOQuery1.Fields.Fields[0].AsString]));
    5: SQL.Add(Format(' and Data0010.CUST_CODE = ''%s'' ' , [ADOQuery1.Fields.Fields[0].AsString]));
    6: SQL.Add(Format(' and Data0025.MANU_PART_NUMBER = ''%s'' ' , [ADOQuery1.Fields.Fields[0].AsString]));
    end;

//    ShowMessage(qry.SQL.Text);
    try
      qry.Open;
    except
      qry.Close;
    end;
    ShowModal;
    Free;
  end;
end;

procedure TFrm_detail.mdsDataChange(Sender: TObject; Field: TField);
begin
  subads.DisableControls;
  dbgsub.SumList.RecalcAll;
  subads.EnableControls;
end;

procedure TFrm_detail.dbgmainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  with   (Sender as TDBGridEh).DataSource do
  begin
    if DataSet is TADODataSet then
      showmessage((DataSet as  TADODataSet).CommandText);
    if DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text);
    if DataSet is TClientDataSet then
      showmessage((DataSet as  TADOQuery).SQL.Text);
  end;
end;

procedure TFrm_detail.dbgsubKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  with   (Sender as TDBGridEh).DataSource do
  begin
    if DataSet is TADODataSet then
      showmessage((DataSet as  TADODataSet).CommandText);
    if DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text);
    if DataSet is TClientDataSet then
      showmessage((DataSet as  TADOQuery).SQL.Text);
  end;
end;

function TFrm_detail.buildfilter: string;
function insearch(c1,c2,c3:TCheckBox):string;
begin
  with TStringList.Create do
  begin
    Delimiter:='|';
    QuoteChar:=#0;
    if not c1.Checked then Add(' PROD_REL <> 1');
    if not c2.Checked then Add(' PROD_REL <> 2');
    if not c3.Checked then Add(' PROD_REL <> 3');
    Result:=StringReplace(DelimitedText,'|', ' and ', [rfReplaceAll]);
    Free;
  end;
end;
var
  i:Integer;
  cb:TCheckBox;
  str:string;
  fmt:TFormatSettings;
begin
  //工厂RKEY是查了数据库后直接定义的  增加删除工厂需要手工修改
  Result:='';
  with TStringList.Create do
  begin
    Delimiter:='|';
    QuoteChar:=' ';
    if (whcb.ItemIndex <> -1) and (whcb.ItemIndex <> 0) then
      Add('('+whcb.Hint+' = ' + IntToStr(Integer(whcb.Items.Objects[whcb.ItemIndex])) + ') ');
//    case whcb.ItemIndex of
//    1:  Add('('+whcb.Hint+' = ' + IntToStr(Integer(whcb.Items[whcb.ItemIndex]) + ') ');
//    2:  Add('('+whcb.Hint+' = 9) ');
//    end;
    case tpcb.ItemIndex of
    1:  Add('('+tpcb.Hint+' = 0) ');
    2:  Add('('+tpcb.Hint+' = 1) ');
    end;
    if not cb1.Checked then Add(' PROD_REL <> 1');
    if not cb2.Checked then Add(' PROD_REL <> 2');
    if not cb3.Checked then Add(' PROD_REL <> 3');
    fmt.DateSeparator:='-';
    fmt.ShortDateFormat:='yyyy-MM-dd';
    fmt.LongDateFormat:='yyyy-MM-dd';
    if cb4.Checked then Add(Format('sdate = ''%s''',[DateToStr(sdtp.Date,fmt)]) );
    Result:=StringReplace(DelimitedText,'|',' and ',[rfReplaceAll]);

    Free;
  end;
  OutputDebugString(PChar(Result));
end;

procedure TFrm_detail.whcbKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key:=0;
end;

procedure TFrm_detail.Filtercheck(Sender: TObject);
begin
  mainqry.Filtered:=False;
  mainqry.Filter:=buildfilter;
  mainqry.Filtered:=True;
end;

procedure TFrm_detail.dbgmainTitleClick(Column: TColumnEh);
begin
  if Column.Index<>dbgmain.Tag then
  begin
    dbgmain.Tag:=Column.Index;
    Label5.Visible:=Column.Tag>0;
    fstr.Visible:=Column.Tag>0;
    Label5.Caption:=StringReplace(Column.Title.Caption,'*','',[rfReplaceAll]);
    fstr.Text:='';
  end;
end;

procedure TFrm_detail.fstrChange(Sender: TObject);
var
  str,flstr:string;
begin
  if Length(fstr.Text) = 0 then
    Exit;
  str := buildfilter;
  flstr := dbgmain.Columns[dbgmain.tag].FieldName + ' like ''%' + fstr.Text + '%'' ';
  if Length(Trim(str)) > 0 then
    mainqry.Filter := str + ' and ' + flstr
  else
    mainqry.Filter := flstr;
end;

end.
