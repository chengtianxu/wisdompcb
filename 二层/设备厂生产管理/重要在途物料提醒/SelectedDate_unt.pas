unit SelectedDate_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, ADODB;

type
  TSelectedDate_frm = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    Notebook1: TNotebook;
    edtValue1: TEdit;
    edtValue2: TEdit;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    dtpStartTime: TDateTimePicker;
    dtpEndTime: TDateTimePicker;
    CheckBox1: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectedDate_frm: TSelectedDate_frm;

Function Show_SelectedDate_frm(SelfForm:TForm; ADODataSet: TDataSet;
       Curr_Date:TDate;FormCaption:string=''):Boolean; StdCall;

implementation

{$R *.dfm}

Function Show_SelectedDate_frm(SelfForm:TForm; ADODataSet: TDataSet;
       Curr_Date:TDate;FormCaption:string=''):Boolean;
begin
  Result:=False;
  try
    SelectedDate_frm:=TSelectedDate_frm.Create(SelfForm);
    with  SelectedDate_frm do
    begin
      Font.Size    := SelfForm.Font.Size;
      Font.Charset := SelfForm.Font.Charset;
      Font.Name    := SelfForm.Font.Name;
      Caption:='Ñ¡Ôñ '+ ADODataSet.FieldByName('FieldCaption').AsString;
      
      if ADODataSet.FieldByName('Condvalu').IsNull=False then
        begin
          dtpStartDate.Date:=  strtodate(formatdatetime('yyyy-mm-dd',ADODataSet.FieldByName('Condvalu').AsDateTime)) ;
          dtpEndDate.Date  :=  strtodate(formatdatetime('yyyy-mm-dd',ADODataSet.FieldByName('Condvalu').AsDateTime)) ;
          dtpStartTime.DateTime:=strtodateTime(formatdatetime('hh:nn:ss',ADODataSet.FieldByName('Condvalu').AsDateTime)) ;
        end
      else
        begin
          dtpStartDate.Date:= Curr_Date     ;
        end;
      if ADODataSet.FieldByName('Condvalu2').IsNull=False then
        begin
          dtpEndDate.Date    :=strtodate(formatdatetime('yyyy-mm-dd',ADODataSet.FieldByName('Condvalu2').AsDateTime))  ;
          dtpEndTime.DateTime:=strtodateTime(formatdatetime('hh:nn:ss',ADODataSet.FieldByName('Condvalu2').AsDateTime));
        end;
      if ADODataSet.FieldByName('Oper').AsString='BETWEEN' then
        CheckBox1.Checked:=True;
      if  dtpEndDate.Date<  Curr_Date then
        dtpEndDate.Date:= Curr_Date  ;
        
      if ShowModal=mrOk then
      begin
        if   ADODataSet.State<>dsEdit then
        ADODataSet.Edit;
        ADODataSet.FieldByName('Condvalu').Value:=
          DateToStr(dtpStartDate.Date)+' '+timeToStr(dtpStartTime.DateTime);
        if CheckBox1.Checked then
        begin
          ADODataSet.FieldByName('Condvalu2').Value:=
            DateToStr(dtpEndDate.Date)+' '+timeToStr(dtpEndTime.DateTime);         
          ADODataSet.FieldByName('Oper').Value:='BETWEEN';
        end
        else
        begin
          if ADODataSet.FieldByName('Oper').Value='BETWEEN' then
          ADODataSet.FieldByName('Oper').Value:='>';
        end;
        Result:=True;
      end;
    end;
  finally
    SelectedDate_frm.Free;
  end;
end;

procedure TSelectedDate_frm.CheckBox1Click(Sender: TObject);
begin
  dtpEndDate.Enabled:= CheckBox1.Checked;
  dtpEndTime.Enabled:= CheckBox1.Checked;
end;

procedure TSelectedDate_frm.OKBtnClick(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

end.
