unit OrderSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ComCtrls;

type
  TFrm_OderSearch = class(TForm)
    Label4: TLabel;
    dtpk1: TDateTimePicker;
    Label3: TLabel;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Edit1: TEdit;
    BtnBrush: TBitBtn;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1curr_date: TDateTimeField;
    ADOQuery1CUST_PART_PTR: TIntegerField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1str_status: TStringField;
    ADOQuery1order_qty: TIntegerField;
    ADOQuery1CONF_DATE: TDateTimeField;
    ADOQuery1so_oldnew: TStringField;
    ADOQuery1YSZP_USER_PTR: TIntegerField;
    ADOQuery1YSZP_DATE: TDateTimeField;
    ADOQuery1YS_USER_PTR: TIntegerField;
    ADOQuery1YS_STAR_DATE: TDateTimeField;
    ADOQuery1YS_EDN_DATE: TDateTimeField;
    ADOQuery1YS_EQ_STATUS: TWordField;
    ADOQuery1YS_EQ_STAR: TDateTimeField;
    ADOQuery1YS_EQ_END: TDateTimeField;
    ADOQuery1CAMZP_USER_PTR: TIntegerField;
    ADOQuery1CAMZP_DATE: TDateTimeField;
    ADOQuery1CAM_USER_PTR: TIntegerField;
    ADOQuery1CAM_STAR_DATE: TDateTimeField;
    ADOQuery1CAM_EDN_DATE: TDateTimeField;
    ADOQuery1CAM_EQ_STATUS: TWordField;
    ADOQuery1CAM_EQ_STAR: TDateTimeField;
    ADOQuery1CAM_EQ_END: TDateTimeField;
    ADOQuery1CAM_SENDBACK: TDateTimeField;
    ADOQuery1QAE_USER_PTR: TIntegerField;
    ADOQuery1QAE_STAR_DATE: TDateTimeField;
    ADOQuery1QAE_END_DATE: TDateTimeField;
    ADOQuery1QAE_SENDBACK: TDateTimeField;
    ADOQuery1E_NAME1: TStringField;
    ADOQuery1E_NAME2: TStringField;
    ADOQuery1E_NAME3: TStringField;
    ADOQuery1E_NAME5: TStringField;
    ADOQuery1E_NAME4: TStringField;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure BtnBrushClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Frm_OderSearch: TFrm_OderSearch;

implementation
 uses
 PasDM,common;
{$R *.dfm}

procedure TFrm_OderSearch.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  Adoquery1.Filter :='location like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TFrm_OderSearch.BtnBrushClick(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TFrm_OderSearch.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
  ModalResult:=mrok;
end;

procedure TFrm_OderSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TFrm_OderSearch.DBGrid1TitleClick(Column: TColumn);
begin
 if(column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label1.Caption := column.Title.Caption;
  edit1.SetFocus;
  adoquery1.Sort:=column.FieldName+' ASC';
 end;
end;

procedure TFrm_OderSearch.FormCreate(Sender: TObject);
begin
  dtpk2.Date := common.getsystem_date(dm.tmp,1);
  dtpk1.Date := dtpk2.Date-7;
end;

procedure TFrm_OderSearch.dtpk1Exit(Sender: TObject);
begin
 ADOQuery1.Close;
 ADOQuery1.Parameters[0].Value := dtpk1.Date;
 ADOQuery1.Parameters[1].Value := dtpk2.Date+1;
 ADOQuery1.Prepared;
 ADOQuery1.Open;
 Button1.Enabled:=not ADOQuery1.IsEmpty;
end;

end.
