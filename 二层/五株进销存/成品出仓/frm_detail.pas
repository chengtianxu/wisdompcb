unit frm_detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Splitter1: TSplitter;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label22: TLabel;
    DATE_SHIPPED: TDateTimePicker;
    Edit1: TEdit;
    DBEdit1: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getNo(s:string):string;
  end;

var
  Form2: TForm2;

implementation

uses damo;

{$R *.dfm}

function tform2.getNo(s:string):string;
var
  spyear,spmonth:string;
  I:Integer;
begin
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select getdate() ,year(getdate()),month(getdate())';
  dm.tmp.Open;
  spyear:=dm.tmp.Fields[1].AsString;
  spmonth:=dm.tmp.Fields[2].AsString;
  if StrToInt(spmonth)<10 then
     s:='CC'+copy(spyear,1,4)+copy('0'+spmonth,1,2)
  else
     s:='CC'+copy(spyear,1,4)+copy(spmonth,1,2);
  dm.tmp.Close;
  dm.tmp.SQL.Text:='select top 1 out_number from product_issue where out_number like '''+s+'%'' order by out_number desc';
  dm.tmp.Open;
  if dm.tmp.IsEmpty then
    s:=s+'0001'
  else begin
    I:=StrToInt(Copy(dm.tmp.Fields[0].AsString,Length(Trim(s))+1,4));
    I:=10000+I+1;
    s:=s+copy(inttostr(I),2,4);
  end;
  Edit1.Text:=s;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  i:integer;
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('出仓单号不能为空！');
    Exit;
  end;
  try
    dm.ADOS1out_number.Value:=Edit1.Text;
    //dm.ADOS1DATE_SHIPPED.AsString:=FormatDateTime('YYYY/MM/DD',DTPk1.date);
    //dm.ADOS1DATE_SHIPPED.AsString:=FormatDateTime('YYYY-MM-DD hh:mm:ss',StrToDateTime(Edit1.Text));
    dm.ADOS1DATE_SHIPPED.AsString:=FormatDateTime('YYYY-MM-DD hh:mm:ss',DATE_SHIPPED.DateTime);
    dm.ADOS1.post();
  except
    messagedlg('保存失败,请检查出仓单号是否重复！',mtinformation,[mbok],0);
    edit1.SetFocus ;
    exit;
  end;
  i:=dm.ADOS1rkey.Value;
  dm.ADOS1.Close;
  dm.ADOS1.Open;
  dm.ADOS1.Locate('rkey',i,[]);
  modalresult:=mrok;
end;

end.
