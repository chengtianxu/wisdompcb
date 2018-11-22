unit WorkOder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, DB;

type
  TFrm_WorkOder = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    BtnBrush: TBitBtn;
    Label5: TLabel;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    PreColumn: TColumn;
    sql_text:string;
  public
    { Public declarations }
  end;

var
  Frm_WorkOder: TFrm_WorkOder;

implementation

uses Demo;

{$R *.dfm}

procedure TFrm_WorkOder.Button1Click(Sender: TObject);
begin
 if dbgrid1.SelectedRows.Count>=1 then
    ModalResult:=mrok
 else
   showmessage('至少选择一条送货单号!')
end;

procedure TFrm_WorkOder.DBGrid1TitleClick(Column: TColumn);
begin
 dm.ADO06.IndexFieldNames:=Column.FieldName;
  if (PreColumn.FieldName<>column.FieldName)and(column.Field.DataType in [ftString,ftWideString]) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;



end.
