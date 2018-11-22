unit IfReplaceFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, StdCtrls, Buttons, ComCtrls;

type
  TFrmIfReplace = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    BtnClose: TBitBtn;
    BtnExportToExcel: TBitBtn;
    BtnQuery: TBitBtn;
    BitBtn1: TBitBtn;
    Lab_Fielter: TLabel;
    Edt_Fielter: TEdit;
    StatusBar1: TStatusBar;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnExportToExcelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edt_FielterChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
  private
    PreColumn :TColumnEh;
    FSql : string;
    { Private declarations }
  public
    FVisible : Integer;
    Fsql821 : string;
    { Public declarations }
  end;

var
  FrmIfReplace: TFrmIfReplace;

implementation

uses damo, ColsDisplaySet_unt, common, DB, QuerySetMaterial;

{$R *.dfm}

procedure TFrmIfReplace.BtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFrmIfReplace.BtnExportToExcelClick(Sender: TObject);
begin
  if not dm.ADS821.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TFrmIfReplace.BitBtn1Click(Sender: TObject);
begin
  show_ColsDisplaySet_frm (Self,DBGridEh1,StrToInt(rkey73)) ;
end;

procedure TFrmIfReplace.FormShow(Sender: TObject);
begin

  if FVisible=1 then
  begin
    frmQuerySetMaterial.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-30;
    frmQuerySetMaterial.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0)+1;
    DM.ads821_Old.Close;
    dm.ads821_Old.CommandText := Fsql821+' and (data0821.CreateDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySetMaterial.DateTimePicker1.Date))+
    ') and (data0821.CreateDate < '+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySetMaterial.DateTimePicker2.Date+1))+
    ') order by CreateDate desc';
    DM.ads821_Old.Open;
    StatusBar1.Panels[0].Text:='总记录数:'+ IntToStr(dm.ADS821_Old.RecordCount);
  end;
  if FVisible=2 then
  begin
    frmQuerySetMaterial.DateTimePicker1.Date := common.getsystem_date(dm.tmp,0)-30;
    frmQuerySetMaterial.DateTimePicker2.Date := common.getsystem_date(dm.tmp,0)+1;
    DM.ads821_Old.Close;
    dm.ads821_Old.CommandText := Fsql821+' and Data0417.Fasset_Code= ' + QuotedStr(DM.ADS831DeviNumb.AsString)+ ' order by CreateDate desc';
    DM.ads821_Old.Open;
    StatusBar1.Panels[0].Text:='总记录数:'+ IntToStr(dm.ADS821_Old.RecordCount);
    BtnQuery.Enabled:= False;
  end;

  if FVisible = 0 then //个人结束的时候
  begin
    Panel2.Visible := False;
    Panel1.Visible := True;
    DBGridEh1.Columns[0].Title.Color := clBtnFace;
    DBGridEh1.Columns[11].ReadOnly := False;
  end
  else
  begin
    Panel2.Visible := True;
    Panel1.Visible := False;
    DBGridEh1.Columns[0].Title.Color := clRed;
    DBGridEh1.Columns[11].ReadOnly := True;
  end;
  PreColumn := DBGridEh1.Columns[0];
  ResetGridColumns(Self,DM.ADOConnection1,StrToInt(rkey73),StrToInt(vprev)=2);
end;

procedure TFrmIfReplace.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  if FVisible = 0 then
    ShowMessage(DM.ADS821.CommandText)
  else
    ShowMessage(DM.ads821_Old.CommandText)
end;

procedure TFrmIfReplace.DBGridEh1TitleClick(Column: TColumnEh);
begin

//  if (Column.Title.SortMarker= smDownEh) or (Column.Title.SortMarker = smNoneEh) then
//  begin
//    Column.Title.SortMarker := smUpEh;
//    DM.ADS821.IndexFieldNames := Column.FieldName;
//  end
//  else
//  begin
//    Column.Title.SortMarker := smDownEh;
//    DM.ADS821.IndexFieldNames := Column.FieldName+' DESC';
//  end;
  if FVisible = 0 then Exit;    //个人结束的时候
  if (PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Lab_Fielter.Caption := Column.Title.Caption;
    Edt_Fielter.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
    Edt_Fielter.Left := Lab_Fielter.Left + Lab_Fielter.Width + 5 ;
  end
  else
  Edt_Fielter.SetFocus;
end;

procedure TFrmIfReplace.Edt_FielterChange(Sender: TObject);
begin
  if Trim(Edt_Fielter.Text)<>'' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+ Trim(Edt_Fielter.Text)+'%'''
  else
    DBGridEh1.DataSource.DataSet.Filter :='';
end;

procedure TFrmIfReplace.Button1Click(Sender: TObject);
begin
  DM.ads821_Old.First;
  while not DM.ads821_Old.Eof do
  begin
    if DM.ads821_Old.FieldByName('ReplaceQuantity').AsInteger <> 0 then
    begin
      DM.ads821_Old.Edit;
      DM.ads821_Old.FieldByName('ReplaceRkey73').AsString := rkey73;
      DM.ads821_Old.FieldByName('ReplaceDate').AsDateTime := common.getsystem_date(DM.tmp,0);
      DM.ads821_Old.Post;
    end;
    DM.ads821_Old.Next;
  end;

  ModalResult := mrOk;
end;

procedure TFrmIfReplace.BtnQueryClick(Sender: TObject);
var
  i:integer;
begin
  if frmQuerySetMaterial.ShowModal =mrok then
  begin
    DM.ads821_Old.Close;

    Fsql :='';
    for i:=1 to frmQuerySetMaterial.SGrid1.RowCount-2 do
    Fsql := FSql+ frmQuerySetMaterial.SGrid1.Cells[2,i]+#13;
    dm.ads821_Old.CommandText := Fsql821+Fsql+' and (data0821.CreateDate >= '+quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySetMaterial.DateTimePicker1.Date))+
    ') and (data0821.CreateDate < '+ quotedstr(formatdatetime('YYYY-MM-DD',frmQuerySetMaterial.DateTimePicker2.Date+1))+')';
    DM.ads821_Old.Open;
    StatusBar1.Panels[0].Text:='/总记录数:'+ IntToStr(dm.ads821_Old.RecordCount);
  end;

end;

end.
