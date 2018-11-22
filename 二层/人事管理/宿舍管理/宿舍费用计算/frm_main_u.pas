unit frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,common,ComCtrls, Grids, DBGrids, Menus, StdCtrls, Buttons, ExtCtrls,
  DateUtils,DB;

type
  Tfrm_main = class(TForm)
    PageControl1: TPageControl;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure PageControl1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    PreColumn: TColumn;
    field_name:string;
    sSql :string;
    sort_mark : integer;
    FsCheck,FsSearch:string;
    procedure init;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo;

{$R *.dfm}

procedure Tfrm_main.FormCreate(Sender: TObject);
var
i: integer;
yearmonth: string;
begin
//  if not app_init(dm.ADOConnection1) then
//  begin
//    common.ShowMsg('程序启动失败,请联系系统管理员',1);
//    application.Terminate;
//    exit;
//  end;
  Caption := application.Title;
//     dm.ADOCon.Open;
    user_ptr := '3';
    vprev := '4';
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  //初始化下拉框
  combobox1.Items.Clear;
  for i:=-12 to 0 do
    begin
      yearmonth :=formatdatetime('yyyy-mm-dd ',incMonth(now,i));
      combobox1.Items.Add(copy(yearmonth,1,7));
    end;
  combobox1.ItemIndex := 12;
  //
  init;
end;

procedure TFrm_main.init;
var  i:byte;
begin
  dm.ADOQuery2.Close;
  dm.ADOQuery1.Close;
  dm.ADOQuery3.Close;
  dm.ADOQuery1.SQL.Text := damo.str_adoquery1+'and  yearmonth='+ quotedstr(combobox1.Text);
  dm.ADOQuery3.SQL.Text := damo.str_adoquery3+'and  yearmonth='+ quotedstr(combobox1.Text);
  dm.ADOQuery1.Filter := '';
  dm.ADOQuery3.Filter := '';
  if pagecontrol1.ActivePage.TabIndex = 0 then
    begin
      dm.ADOQuery3.Close;
      dm.ADOQuery1.Open;
      dm.ADOQuery2.Open;
    end;
  if pagecontrol1.ActivePage.TabIndex = 1 then
    begin
      dm.ADOQuery3.Open;
      dm.ADOQuery2.Close;
      dm.ADOQuery1.Close;
    end;
  field_name := dbgrid1.Columns[0].FieldName;
  PreColumn := dbgrid1.Columns[0];
  label1.Caption :=dbgrid1.Columns[0].Title.Caption ;
  sort_mark := 0;
  dbgrid1.Columns[0].Title.Color := clred ;
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
begin
  if  ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
dm.ADOTMP.SQL.Clear;
dm.ADOTMP.SQL.Text := 'exec dbo.hrsp_bedroomfees_init '+quotedstr(combobox1.Text);
try
  dm.ADOTMP.ExecSQL;
  showmessage(combobox1.Text+'月份的宿舍费用计算初始化完成');
  dm.ADOQuery1.Close;
  dm.ADOQuery1.Open;
except
  showmessage('初始化失败');
end;
end;

procedure Tfrm_main.ComboBox1Change(Sender: TObject);
begin
dm.ADOQuery2.Close;
dm.ADOQuery1.Close;
dm.ADOQuery3.Close;
dm.ADOQuery1.SQL.Text := damo.str_adoquery1+'and  yearmonth='+ quotedstr(combobox1.Text);
dm.ADOQuery3.SQL.Text := damo.str_adoquery3+'and  yearmonth='+ quotedstr(combobox1.Text);
dm.ADOQuery1.Filter := '';
dm.ADOQuery3.Filter := '';
if pagecontrol1.ActivePage.TabIndex = 0 then
  begin
    dm.ADOQuery3.Close;
    dm.ADOQuery1.Open;
    dm.ADOQuery2.Open;
  end;
if pagecontrol1.ActivePage.TabIndex = 1 then
  begin
    dm.ADOQuery3.Open;
    dm.ADOQuery2.Close;
    dm.ADOQuery1.Close;
  end;
end;

procedure Tfrm_main.TabSheet1Enter(Sender: TObject);
begin
dm.ADOQuery1.Open;
dm.ADOQuery2.Open;
end;

procedure Tfrm_main.TabSheet2Enter(Sender: TObject);
begin
dm.ADOQuery3.Open;
dm.ADOQuery3.Sort := 'employeecode';
end;

procedure Tfrm_main.BitBtn4Click(Sender: TObject);
var i,j,k,rkey : integer;
    D,X,Y : real;
    yearmonth_last,yearmonth_now : tdatetime;
    last_yearmonth : string;
    record_e,record_w:   array   of   real;
  begin

  yearmonth_now := strtodate(combobox1.Text+'-01');
  yearmonth_last := incMonth(yearmonth_now,-1);
  last_yearmonth := formatdatetime('yyyy-mm-dd ',yearmonth_last);
  last_yearmonth := copy(last_yearmonth,1,7);
  //showmessage(last_yearmonth); 
  if  ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;
  try
    //SetLength   (Array1,   100);
    //Array1   [99]   :=   100;   //   OK
    dm.ADOTMP.SQL.Clear;
    progressbar1.Position := 0;
    dm.ADOTMP.SQL.Text := 'exec dbo.hrsp_bedroomfees_pro '
      +quotedstr(combobox1.Text);
    progressbar1.Visible := true;
    dm.ADOTMP.ExecSQL;
    progressbar1.Position := 10;
    dm.ADOQuery4.Close;
    dm.ADOQuery4.SQL.Clear;
    dm.ADOQuery4.SQL.Text := 'select * from Bedroomfees where yearmonth='+ quotedstr(combobox1.Text);
    ShowMessage(DM.ADOQuery4.SQL.Text);
    dm.ADOQuery4.Open;
    if not dm.ADOQuery4.IsEmpty then
    begin
     dm.ADOQuery4.First;
     k := dm.ADOQuery4.RecordCount; //宿舍个数
      for i := 0 to k-1 do
      if  (not dm.ADOQuery4.Eof)  then
        begin
           rkey := dm.ADOQuery4roomid.Value ; 
           progressbar1.Position:= 10+trunc(i/k)*90;
           dm.ADOQuery4.Next;
           application.ProcessMessages;
        end;

    end;
    progressbar1.Position := 100;
    showmessage(combobox1.Text+'月份的宿舍费用计算完成');
    progressbar1.Visible := false;
    progressbar1.Position := 0;
    dm.ADOQuery4.Close;
    dm.ADOQuery2.Close;
    dm.ADOQuery1.Close;
    dm.ADOQuery1.Open;
    dm.ADOQuery2.Open;
except
  showmessage('计算失败');
end;

end;

procedure Tfrm_main.BitBtn5Click(Sender: TObject);
begin 
if pagecontrol1.ActivePage.TabIndex = 0 then
  begin
  Export_dbGrid_to_Excel(DBGrid1,self.Caption);
  end;
if pagecontrol1.ActivePage.TabIndex = 1 then
  begin
  Export_dbGrid_to_Excel(DBGrid3,self.Caption);
  end;

end;

procedure Tfrm_main.DBGrid1TitleClick(Column: TColumn);
begin
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (sort_mark =0)  then
  begin
    sort_mark:=1;
    dm.ADOQuery1.Sort := column.FieldName;
  end
  else
  begin
    sort_mark:=0;
    dm.ADOQuery1.Sort:=Column.FieldName+' DESC';
  end;
  //DM.ADO70AfterScroll(DM.ADO70);
  if dbgrid1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    //Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure Tfrm_main.DBGrid3TitleClick(Column: TColumn);
begin
if dbgrid3.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (sort_mark =0)  then
  begin
    sort_mark:=1;
    dm.ADOQuery3.Sort := column.FieldName;
  end
  else
  begin
    sort_mark:=0;
    dm.ADOQuery3.Sort:=Column.FieldName+' DESC';
  end;
  //DM.ADO70AfterScroll(DM.ADO70);
  if dbgrid3.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    //Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure Tfrm_main.PageControl1Change(Sender: TObject);
var i: integer;
begin
  for i:=0 to dbgrid1.Columns.Count-1 do
    begin
      dbgrid1.Columns[i].Title.Color := clBtnFace ;
    end;
  for i:=0 to dbgrid3.Columns.Count-1 do
    begin
      dbgrid3.Columns[i].Title.Color := clBtnFace ;
    end;
  if pagecontrol1.ActivePage.TabIndex = 0 then
    begin
      field_name := dbgrid1.Columns[0].FieldName;
      PreColumn := dbgrid1.Columns[0];
      label1.Caption :=dbgrid1.Columns[0].Title.Caption ;
      edit1.Text := '';
      sort_mark := 0;
      dbgrid1.Columns[0].Title.Color := clred ;
    end;
  if pagecontrol1.ActivePage.TabIndex = 1 then
    begin
      field_name := dbgrid3.Columns[0].FieldName;
      PreColumn := dbgrid3.Columns[0];
      label1.Caption :=dbgrid3.Columns[0].Title.Caption ;
      edit1.Text := '';
      sort_mark := 0;
      dbgrid3.Columns[0].Title.Color := clred ;
    end;
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if pagecontrol1.ActivePage.TabIndex = 0 then
    begin
      if dbgrid1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
      if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
      begin
        if trim(Edit1.text) <> '' then
        begin
          if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            dbgrid1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
          else if dbgrid1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            dbgrid1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
        end else
          dbgrid1.DataSource.DataSet.Filter:='';
      end;
    end;
  if pagecontrol1.ActivePage.TabIndex = 1 then
    begin
      if dbgrid3.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
      if dbgrid3.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
      begin
        if trim(Edit1.text) <> '' then
        begin
          if dbgrid3.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
            dbgrid3.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
          else if dbgrid3.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
            dbgrid3.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
        end else
          dbgrid3.DataSource.DataSet.Filter:='';
      end;
    end;
end;

end.
