unit uSumQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, DB, ADODB, main, common;

type
  TfrmSumQuery = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnQuery: TBitBtn;
    sbtnExit: TSpeedButton;
    dsQuery: TDataSource;
    aqQuery: TADOQuery;
    aqQueryCUT_NO: TStringField;
    aqQueryMANU_PART_NUMBER: TStringField;
    aqQueryMANU_PART_DESC: TStringField;
    aqQueryANALYSIS_CODE_2: TStringField;
    aqQueryPROD_CODE: TStringField;
    aqQueryPRODUCT_NAME: TStringField;
    aqQueryDEPT_CODE: TStringField;
    aqQueryDEPT_NAME: TStringField;
    aqQueryISSUE_DATE: TDateTimeField;
    aqQuerySCH_COMPL_DATE: TDateTimeField;
    aqQuerytotal_qtypcs: TFloatField;
    aqQuerytotal_qtypanel: TIntegerField;
    aqQuerytotal_tobestock: TFloatField;
    aqQueryprod_Square: TFloatField;
    aqQueryprod_Square_includingBoader: TFloatField;
    btnExcel: TBitBtn;
    procedure sbtnExitClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSumQuery: TfrmSumQuery;

implementation

{$R *.dfm}

procedure TfrmSumQuery.sbtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSumQuery.btnQueryClick(Sender: TObject);
begin
  aqQuery.Close;
  aqQuery.Open;
  Edit1Change(nil);
end;

procedure TfrmSumQuery.FormShow(Sender: TObject);
begin
  aqQuery.Close;
  aqQuery.Open;
end;

procedure TfrmSumQuery.Edit1Change(Sender: TObject);
begin
  if not aqQuery.Active then Exit;
  aqQuery.Filter:= '';
  if Edit1.Text<>'' then aqQuery.Filter:= 'MANU_PART_NUMBER like ''%'+Edit1.Text+'%''';
  if Edit2.Text<>'' then
  begin
    if aqQuery.Filter='' then
      aqQuery.Filter:= 'MANU_PART_DESC like ''%'+Edit2.Text+'%'''
    else
      aqQuery.Filter:= aqQuery.Filter+' and MANU_PART_DESC like ''%'+Edit2.Text+'%''';
  end;
  if Edit3.Text<>'' then
  begin
    if aqQuery.Filter='' then
      aqQuery.Filter:= 'DEPT_CODE like ''%'+Edit3.Text+'%'''
    else
      aqQuery.Filter:= aqQuery.Filter+' and DEPT_CODE like ''%'+Edit3.Text+'%''';
  end;
  if Edit4.Text<>'' then
  begin
    if aqQuery.Filter='' then
      aqQuery.Filter:= 'DEPT_NAME like ''%'+Edit4.Text+'%'''
    else
      aqQuery.Filter:= aqQuery.Filter+' and DEPT_NAME like ''%'+Edit4.Text+'%''';
  end;
end;

procedure TfrmSumQuery.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmsg(aqQuery.SQL.Text,1);
end;

procedure TfrmSumQuery.DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.Active then
  begin
    if TDBGridEh(Sender).DataSource.DataSet is TADOQuery then
    begin
      if Column.Title.SortMarker = smDownEh then  //≈≈–Ú
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName
      else
        TADOQuery(TDBGridEh(Sender).DataSource.DataSet).Sort:= Column.FieldName + ' DESC';
    end;
  end;
end;

procedure TfrmSumQuery.btnExcelClick(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1, self.Caption);
end;

end.
