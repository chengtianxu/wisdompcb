unit frm_alloc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB, ADODB, Buttons;

type
  TForm_alloc = class(TForm)
    ads475: TADODataSet;
    ads475INV_PART_NUMBER: TStringField;
    ads475INV_NAME: TStringField;
    ads475INV_DESCRIPTION: TStringField;
    ads475quan_alloc: TBCDField;
    ads475EMPLOYEE_NAME: TStringField;
    ads475alloc_datetime: TDateTimeField;
    ads475CUT_NO: TStringField;
    DataSource1: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Panel2: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn4: TBitBtn;
    ads475MANU_PART_NUMBER: TStringField;
    ads475MANU_PART_DESC: TStringField;
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ads475AfterOpen(DataSet: TDataSet);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumn;
  public
    { Public declarations }
  end;

var
  Form_alloc: TForm_alloc;

implementation

uses DM_u,common;

{$R *.dfm}

procedure TForm_alloc.BitBtn4Click(Sender: TObject);
begin
if not ads475.IsEmpty then
 common.Export_dbGrid_to_Excel(self.DBGrid1,self.Caption);
end;

procedure TForm_alloc.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   DBGrid1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else
   dbgrid1.DataSource.DataSet.Filter:='';
end;

procedure TForm_alloc.FormActivate(Sender: TObject);
begin
 ads475.Open;
 PreColumn := DBGrid1.Columns[0];
end;

procedure TForm_alloc.ads475AfterOpen(DataSet: TDataSet);
begin
 Button1.Enabled:= not DataSet.IsEmpty
end;

procedure TForm_alloc.DBGrid1TitleClick(Column: TColumn);
begin
 if (PreColumn.FieldName<>column.FieldName)  then
  self.ads475.IndexFieldNames:=Column.FieldName;
  
  if (PreColumn.FieldName<>column.FieldName)  and
     (column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm_alloc.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ads475.CommandText);
end;

procedure TForm_alloc.Button1Click(Sender: TObject);
begin
 ads475.Filtered:=False;
 if Msg_Dlg_Ask('你确认要取消以上分配记录？','提示',1) then
 begin
  DM.ADOCon.BeginTrans;
  with dm.tmp do
  begin
   Close;
   sql.Text:='update data0017 set QUAN_ASSIGN=QUAN_ASSIGN-d1.total_alloc'+#13+
    'from data0017 inner join('+#13+
    'SELECT   Data0022.INVENTORY_PTR,sum(DATA0475.quan_alloc) as total_alloc'+#13+
    'FROM  dbo.Data0022 INNER JOIN'+#13+
    '  dbo.DATA0475 ON dbo.Data0022.RKEY = dbo.DATA0475.rkey22'+#13+
    'where datediff(day,data0475.alloc_datetime,getdate())>4'+#13+
    'group by Data0022.INVENTORY_PTR) as d1 on data0017.rkey=d1.INVENTORY_PTR';
   ExecSQL;
  end;

  with dm.tmp do
  begin
   Close;
   sql.Text:='update data0022 set QUAN_TO_BE_STOCKED=QUAN_TO_BE_STOCKED-d1.total_alloc'+#13+
    ' from data0022 inner join ('+#13+
    'select rkey22,sum(quan_alloc) as total_alloc from data0475'+#13+
    'where datediff(day,alloc_datetime,getdate())>4'+#13+
    'group by rkey22) as d1 on data0022.rkey=d1.rkey22';
   ExecSQL;
  end;

  with dm.tmp do
  begin
   Close;
   sql.Text:='update data0468 set quan_alloc=quan_alloc-d1.total_alloc'+#13+
   ' from data0468 inner join ('+#13+
   ' select rkey468,sum(quan_alloc) as total_alloc from data0475'+#13+
   ' where datediff(day,alloc_datetime,getdate())>4'+#13+
   ' group by rkey468) as d1 on data0468.rkey=d1.rkey468';
      ExecSQL;
  end;

  with dm.tmp do
  begin
   SQL.Text:='delete data0475 where datediff(day,data0475.alloc_datetime,getdate())>4';
   ExecSQL;
  end;
  dm.ADOCon.CommitTrans;
  ShowMsg('取消４天前分配记录操作成功',1);
  Self.ModalResult:=mrOk;
 end
 else
  ads475.Filtered:=true;
end;

end.
