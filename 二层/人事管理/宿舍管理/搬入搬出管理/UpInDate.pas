unit UpInDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DM, common;

type
  TFrmIndate = class(TForm)
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIndate: TFrmIndate;

implementation

{$R *.dfm}

procedure TFrmIndate.FormCreate(Sender: TObject);
begin
  Edit1.Text := damo.qry5.FieldValues['startdate'];
  DateTimePicker1.Date := Now;
end;

procedure TFrmIndate.BitBtn1Click(Sender: TObject);
begin
  //修改入住日期
 with damo.qrytemp do
 begin
   Close;
   SQL.Clear;
   SQL.Text := 'update Bedroomusemsg set startdate=' + QuotedStr(DateToStr(DateTimePicker1.Date))
     + ' where rkey =' + IntToStr(damo.qry5.FieldValues['BedUseMsgrkey']);
   ExecSQL;
   ShowMessage('保存成功！');
   Self.Close;
 end;
end;

procedure TFrmIndate.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
