unit Employee_search;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, Buttons, StdCtrls, ADODB, ExtCtrls;

type
  TFrmEmployeeSearch = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEmployeeSearch: TFrmEmployeeSearch;

implementation

uses datamodule;
{$R *.DFM}

procedure TFrmEmployeeSearch.Edit1Change(Sender: TObject);
begin
  if copy(Dbgrid1.Columns[0].Title.caption,1,1)='*' then
    if trim(Edit1.text)<>'' then
      DM.ADO0005.Filter :='empl_code like '''+edit1.text+'%'''
    else DM.ADO0005.filter:=''
  else
    if trim(Edit1.text)<>'' then
      DM.ADO0005.Filter :='employee_name like '''+edit1.text+'%'''
    else DM.ADO0005.filter:=''

end;

procedure TFrmEmployeeSearch.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then modalresult:=mrok;
end;

procedure TFrmEmployeeSearch.SpeedButton1Click(Sender: TObject);
begin
DM.ADO0005.Filter :='';
edit1.setfocus;
end;

procedure TFrmEmployeeSearch.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TFrmEmployeeSearch.FormCreate(Sender: TObject);
begin
  DM.ADO0005.Open ;
end;

procedure TFrmEmployeeSearch.Button1Click(Sender: TObject);
begin
  if DM.ADO0005.Eof then exit;
  modalresult:=mrok;
end;

procedure TFrmEmployeeSearch.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus ;
  Edit1.SelectAll;
end;

procedure TFrmEmployeeSearch.DBGrid1TitleClick(Column: TColumn);
begin
  if column.Index =0 then
  begin
    Dbgrid1.Columns[0].Title.caption :='*雇员代号';
    Dbgrid1.Columns[1].Title.Caption :='雇员名称';
    Label1.Caption :='雇员代号';
    with DM.ADO0005 do
    begin
      close;
      sql.Clear ;
      sql.Add('select rkey,empl_code,employee_name from data0005 order by empl_code');
      open;
    end;
  end else
  begin
    Dbgrid1.Columns[0].Title.caption :='雇员代号';
    Dbgrid1.Columns[1].Title.Caption :='*雇员名称';
    Label1.Caption :='雇员名称';
    with DM.ADO0005 do
    begin
      close;
      sql.Clear ;
      sql.Add('select rkey,empl_code,employee_name from data0005 order by employee_name');
      open;
    end;
  end;
end;

procedure TFrmEmployeeSearch.FormDestroy(Sender: TObject);
begin
dm.ADO0005.Close;
end;

end.
