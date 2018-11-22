unit Frm_WkP_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons;

type
  TFrm_WkP = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtKeyValue: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1dept_code: TStringField;
    ADOQuery1dept_name: TStringField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ADOQuery1typeNm: TStringField;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtKeyValueChange(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    vColumn1: TColumn;
  public
    rkey0006:integer ;
  end;

implementation

uses DM_u;

{$R *.dfm}

procedure TFrm_WkP.RadioGroup1Click(Sender: TObject);
begin
  self.ADOQuery1.Close ;
  if RadioGroup1.ItemIndex = 0 then
    self.ADOQuery1.sql.Text:='select rkey,dept_code,dept_name,CASE WHEN TTYPE = 1 THEN ''工序'' '+
                                                      'WHEN TTYPE = 4 THEN ''部门'' '+
                                                      'WHEN ttype = 5  THEN ''班组'' END AS typeNm ,ttype from data0034 where ttype in (1,4,5) '
                            +'and ACTIVE_FLAG=0 ORDER by ttype,dept_code'
  else
   if RadioGroup1.ItemIndex = 1 then
    self.ADOQuery1.sql.Text:='SELECT Data0034.RKEY, Data0034.DEPT_CODE,'+
                             'Data0034.DEPT_NAME,CASE WHEN Data0034.TTYPE = 1 THEN ''工序'' '+
                                                      'WHEN Data0034.TTYPE = 4 THEN ''部门'' '+
                                                      'WHEN Data0034.ttype = 5  THEN ''班组'' END AS typeNm ,'+

                             'Data0034.TTYPE '+
                             'FROM Data0038 INNER JOIN '+
                             'Data0034 ON Data0038.DEPT_PTR=Data0034.RKEY INNER JOIN ' +
                             'Data0025 INNER JOIN '+
                             'Data0006 ON Data0025.RKEY=Data0006.BOM_PTR ON '+
                             'Data0038.SOURCE_PTR=Data0025.RKEY '+
                             'WHERE Data0006.RKEY='+inttostr(rkey0006)+
                             ' ORDER BY Data0038.STEP_NUMBER';
  self.ADOQuery1.Open ;
end;

procedure TFrm_WkP.BitBtn1Click(Sender: TObject);
begin
  if not self.ADOQuery1.IsEmpty then
      modalresult:=mrok;
end;

procedure TFrm_WkP.BitBtn3Click(Sender: TObject);
begin
  edtKeyValue.Text:='';
  edtKeyValue.SetFocus;
end;

procedure TFrm_WkP.edtKeyValueChange(Sender: TObject);
begin
  if trim(edtKeyValue.text)<>'' then
     ADOQuery1.Filter := vColumn1.FieldName+' like ''%'+trim(edtKeyValue.TEXT)+'%'''
  else
     ADOQuery1.Filter:='';
end;

procedure TFrm_WkP.DBGrid1TitleClick(Column: TColumn);
begin
  edtKeyValue.Text :='';
  if vColumn1.Field.Name<>Column.Field.Name then
  begin
    vColumn1.Title.Color :=clBtnFace;
    vColumn1:=Column;
    vColumn1.Title.Color :=clRed;
    Label1.Caption :='  '+trim(vColumn1.Title.Caption) +':  ';
    ADOQuery1.Sort := vColumn1.FieldName ;
  end;
end;

procedure TFrm_WkP.FormShow(Sender: TObject);
begin
  vColumn1:=DBGrid1.Columns[0];
  vColumn1.Title.Color :=clBtnFace;
  vColumn1.Title.Color :=clRed;
  Label1.Caption :='  '+trim(vColumn1.Title.Caption) +':  ';
  ADOQuery1.Sort := vColumn1.FieldName ;
end;

end.
