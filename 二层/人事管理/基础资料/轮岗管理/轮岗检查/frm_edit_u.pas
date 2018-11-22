unit frm_edit_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TForm_edit = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lab_emp_id: TLabel;
    lab_remark_rkey: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    Lab_departmentname: TLabel;
    Lab_employeecode: TLabel;
    Lab_zhiwu: TLabel;
    Lab_chinesename: TLabel;
    lab_circle: TLabel;
    Lab_begindate: TLabel;
    lab_departmentid: TLabel;
    lab_zhiwuid: TLabel;
    Lab_enddate: TLabel;
    mmo1: TMemo;
    Edit1: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_edit: TForm_edit;

implementation

{$R *.dfm}

procedure TForm_edit.btn1Click(Sender: TObject);
begin
  modalresult:=mrok;
end;



procedure TForm_edit.btn2Click(Sender: TObject);
begin
  close;
end;
procedure TForm_edit.Edit1Change(Sender: TObject);
var i,j,k :Integer;
   date_e : TDateTime;
begin

   date_e := StrToDate(Lab_begindate.Caption);
   if TryStrToInt(Trim(Edit1.Text),i) then
   begin
      j :=   StrToInt(lab_circle.Caption)+  strtoint(Trim(Edit1.Text));
      Lab_enddate.Caption :=  DateToStr( IncMonth(date_e,j));
   end
   else
   begin
     k := StrToInt(lab_circle.Caption);
     Lab_enddate.Caption :=  DateToStr( IncMonth(date_e,k));
   end;
end;



procedure TForm_edit.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
    ShowMessage('只能输入数字');
  end;
end;

end.
