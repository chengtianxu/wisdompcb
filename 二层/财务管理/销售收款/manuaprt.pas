unit manuaprt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ExtCtrls, StdCtrls;

type
  TFrm_manuaprt = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    DS25: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADO25: TADOQuery;
    ADO25CUST_CODE: TStringField;
    ADO25CUSTOMER_NAME: TStringField;
    ADO25ABBR_NAME: TStringField;
    ADO25MANU_PART_NUMBER: TStringField;
    ADO25MANU_PART_DESC: TStringField;
    ADO25ANALYSIS_CODE_2: TStringField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    preColumn:TColumnEh;

  public
    { Public declarations }
    custCode:string;
  end;

var
  Frm_manuaprt: TFrm_manuaprt;

implementation

uses DAMO;

{$R *.dfm}

procedure TFrm_manuaprt.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if preColumn.FieldName<>Column.FieldName then
  begin
    Label1.Caption:=Column.Title.Caption;
    preColumn.Title.Color:=clBtnFace;
    Column.Title.Color:=clRed;
    preColumn:=Column;
  end;
end;

procedure TFrm_manuaprt.FormShow(Sender: TObject);
begin
  preColumn:=DBGridEh1.Columns[0];
  CheckBox1Click(nil);
end;

procedure TFrm_manuaprt.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_manuaprt.Button1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrm_manuaprt.CheckBox1Click(Sender: TObject);
begin
  ADO25.Close;
  if CheckBox1.Checked then
  begin
    ADO25.SQL.Clear;
    ADO25.SQL.Text:='SELECT Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,'+
                    'Data0010.ABBR_NAME,Data0025.MANU_PART_NUMBER,'+
                    'Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2 '+
                    'FROM   Data0025 INNER JOIN '+
                    'Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '+
                    'WHERE  Data0025.PARENT_PTR is null AND Data0010.CUST_CODE=:CUST_CODE '+
                    'ORDER BY Data0025.MANU_PART_NUMBER';
    ADO25.Parameters[0].Value:=custCode;
  end
  else
  begin
    ADO25.SQL.Clear;
    ADO25.SQL.Text:='SELECT Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,'+
                    'Data0010.ABBR_NAME,Data0025.MANU_PART_NUMBER,'+
                    'Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2 '+
                    'FROM   Data0025 INNER JOIN '+
                    'Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY '+
                    'WHERE  Data0025.PARENT_PTR is null '+
                    'ORDER BY Data0025.MANU_PART_NUMBER';
  end;
  ADO25.Open;
end;

procedure TFrm_manuaprt.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
    ADO25.Filter:=preColumn.FieldName+' like ''%'+trim(Edit1.Text)+'%'''
  else
    ADO25.Filter:='';
end;

procedure TFrm_manuaprt.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(ADO25.SQL.Text);
end;

end.
