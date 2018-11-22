unit deptser_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TForm_deptser = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_deptser: TForm_deptser;

implementation

uses main,damo;
{$R *.dfm}

procedure TForm_deptser.Button2Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_deptser.Button1Click(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_deptser.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_deptser.Edit1Change(Sender: TObject);
begin
 if trim(edit1.text)<>'' then
 begin
  if  trim(label1.Caption)='部门编号：' then
  adoquery1.Filter:='DEPT_CODE like '''+trim(EDIT1.TEXT)+'%'''
 else
   adoquery1.Filter:='DEPT_NAME like '''+trim(EDIT1.TEXT)+'%''' ;
 end
else  adoquery1.Filter:='';
end;

procedure TForm_deptser.DBGrid1DblClick(Sender: TObject);
begin
modalresult:=mrok;
end;

procedure TForm_deptser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then dbgrid1dblclick(sender);
end;

procedure TForm_deptser.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>'借贷方向' then
 begin
  dbgrid1.columns[0].Title.color:=clbtnface;
  dbgrid1.columns[1].Title.color:=clbtnface;
 if column.FieldName='DEPT_CODE' then
  begin
   label1.Caption:='部门编号：';
   column.Title.Color:=clred;
   edit1.SetFocus;
   end
   else if column.FieldName='DEPT_NAME' then
  begin
   label1.Caption:='部门名称:';
   column.Title.Color:=clred ;
  edit1.SetFocus;
  end;
 end;
end;

procedure TForm_deptser.FormCreate(Sender: TObject);
begin
adoquery1.Open;
end;

end.
