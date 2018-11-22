unit count_empl_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_empl_search = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1RKEY: TIntegerField;
    ADOQuery1EMPL_CODE: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_empl_search: TForm_empl_search;

implementation
uses damo,main;

{$R *.dfm}

procedure TForm_empl_search.FormCreate(Sender: TObject);
begin
adoquery1.Open;
end;

procedure TForm_empl_search.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_empl_search.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_empl_search.Button2Click(Sender: TObject);
begin
close;
end;

procedure TForm_empl_search.Edit1Change(Sender: TObject);
begin
if trim(edit1.text)<>'' then
 begin
  if  trim(label1.Caption)='员工代码:' then
  adoquery1.Filter:='EMPL_CODE like '''+trim(EDIT1.TEXT)+'%'''
 else
   adoquery1.Filter:='EMPLOYEE_NAME like '''+trim(EDIT1.TEXT)+'%''' ;
 end
else  adoquery1.Filter:='';
end;
procedure TForm_empl_search.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'借贷方向' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='EMPL_CODE' then
  begin
   label1.Caption:='员工代码:';
   column.Title.Color:=clred;
  edit1.SetFocus;
   end
   else if column.FieldName='EMPLOYEE_NAME' then
  begin
   label1.Caption:='员工名称:';
   column.Title.Color:=clred ;
  edit1.SetFocus;
  end;
 end;
end;

procedure TForm_empl_search.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_empl_search.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then DBGrid1DblClick(sender);
end;

end.
