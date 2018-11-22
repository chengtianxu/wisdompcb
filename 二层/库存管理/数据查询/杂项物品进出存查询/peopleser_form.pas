unit peopleser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids, ExtCtrls;

type
  TForm_peopleser = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1EMPL_CODE: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_peopleser: TForm_peopleser;

implementation
uses main,damo;

{$R *.dfm}

procedure TForm_peopleser.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_peopleser.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_peopleser.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_peopleser.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_peopleser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;

procedure TForm_peopleser.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
 begin
  if  trim(label1.Caption)='员工编号:' then
  adoquery1.Filter:='EMPL_CODE like '''+trim(EDIT1.TEXT)+'%'''
 else
   adoquery1.Filter:='EMPLOYEE_NAME like '''+trim(EDIT1.TEXT)+'%''' ;
 end
else  adoquery1.Filter:='';
end;

procedure TForm_peopleser.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'借贷方向' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='EMPL_CODE' then
  begin
   label1.Caption:='员工编号:';
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

procedure TForm_peopleser.FormCreate(Sender: TObject);
begin
ADOQUERY1.Open;
end;

end.
