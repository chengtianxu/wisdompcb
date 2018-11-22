unit DeptCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, DB, ADODB;

type
  TFrm_DeptCode = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ads34: TADODataSet;
    ads34rkey: TIntegerField;
    ads34DEPT_CODE: TStringField;
    ads34DEPT_NAME: TStringField;
    ADODataSet1: TADODataSet;
    DataSource2: TDataSource;
    ADODataSet1USER_FULL_NAME: TStringField;
    ADODataSet1USER_LOGIN_NAME: TStringField;
    ADODataSet1RKEY: TAutoIncField;
    ADODataSet1EMPLOYEE_ID: TIntegerField;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    procedure MaskEdit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure ads34AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    field_name,field_name1:string;
    PreColumn,PreColumn1: TColumn;
  public
    { Public declarations }
  end;

var
  Frm_DeptCode: TFrm_DeptCode;

implementation

uses Demo;

{$R *.dfm}

procedure TFrm_DeptCode.MaskEdit1Change(Sender: TObject);
begin
if trim(MaskEdit1.text)<>'' then
    ADS34.Filter :=field_name+' like ''%'+Trim(MaskEdit1.Text)+'%'''
else
    ADS34.filter:='';

end;

procedure TFrm_DeptCode.BitBtn2Click(Sender: TObject);
begin
Edit1.Text := '';
Edit1.SetFocus;
end;

procedure TFrm_DeptCode.FormCreate(Sender: TObject);
begin
 field_name := DBGrid1.Columns[0].FieldName;
 PreColumn := DBGrid1.Columns[0];
 field_name1 := DBGrid2.Columns[0].FieldName;
 PreColumn1 := DBGrid2.Columns[0];
end;

procedure TFrm_DeptCode.DBGrid1TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  ADS34.IndexFieldNames:=column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  PreColumn := column;
  Column.Title.Color := clred;
  self.MaskEdit1.SetFocus;
 end
else
 self.MaskEdit1.SetFocus;
end;

procedure TFrm_DeptCode.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (not ADS34.IsEmpty) then  modalresult:=mrok;
end;

procedure TFrm_DeptCode.DBGrid1DblClick(Sender: TObject);
begin
if not ADS34.IsEmpty then  modalresult:=mrok;
end;

procedure TFrm_DeptCode.Button1Click(Sender: TObject);
begin
//  if (dbgrid1.SelectedRows.Count>=1) and (DBGrid2.SelectedRows.Count>=1)  then
//     ModalResult:=mrok
//  else
//   showmessage('请点击选择审批部门及信息提示人员!');
  if dbgrid1.SelectedRows.Count>=1 then
     ModalResult:=mrok
  else
   showmessage('请点击选择审批部门!');
end;

procedure TFrm_DeptCode.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
    ADODataSet1.Filter :=field_name1+' like ''%'+Trim(Edit1.Text)+'%'''
else
    ADODataSet1.filter:='';

end;

procedure TFrm_DeptCode.DBGrid2TitleClick(Column: TColumn);
begin
if column.FieldName<>self.field_name1 then
 begin
  label4.Caption:=column.Title.Caption;
  field_name1:=column.FieldName;
  ADODataSet1.IndexFieldNames:=column.FieldName;
  PreColumn1.Title.Color := clBtnFace;
  PreColumn1 := column;
  Column.Title.Color := clred;
  self.Edit1.SetFocus;
 end
else
 self.Edit1.SetFocus;
end;

procedure TFrm_DeptCode.ads34AfterScroll(DataSet: TDataSet);
begin
  ADODataSet1.Close;
  ADODataSet1.Parameters[0].Value := ads34rkey.Value;
  ADODataSet1.Open;
end;

end.
