unit UpOutDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, common, DM;

type
  TFrmOutdate = class(TForm)
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker2: TDateTimePicker;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOutdate: TFrmOutdate;

implementation

{$R *.dfm}

procedure TFrmOutdate.FormCreate(Sender: TObject);
begin
  Edit1.Text := damo.qry6.FieldValues['enddate'];
  DateTimePicker2.Date := Now;
end;

procedure TFrmOutdate.BitBtn1Click(Sender: TObject);
begin
  //修改搬出日期
 with damo.qrytemp do
 begin
   Close;
   SQL.Clear;
   SQL.Text := 'update Bedroomusemsg set enddate=' + QuotedStr(DateToStr(DateTimePicker2.Date))
     + ' where rkey =' + IntToStr(damo.qry6.FieldValues['BedUseMsgrkey']); 
   ExecSQL;
   ShowMessage('保存成功！');
   damo.qry6.Close;
   damo.qry6.Open;
 end;
 Self.Close;
end;

procedure TFrmOutdate.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
