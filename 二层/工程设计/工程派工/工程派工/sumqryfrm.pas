unit sumqryfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, PasDM;

type
  Tfrmsumqry = class(TForm)
    rg1: TRadioGroup;
    lbl1: TLabel;
    dtp1: TDateTimePicker;
    lbl2: TLabel;
    dtp2: TDateTimePicker;
    btn1: TButton;
    btn2: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  DateUtils;

{$R *.dfm}

procedure Tfrmsumqry.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure Tfrmsumqry.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrmsumqry.FormShow(Sender: TObject);
begin
  DM.tmp.Close;
  DM.tmp.SQL.Clear;
  DM.tmp.SQL.Add('select getdate() as nowtime');
  DM.tmp.Open;
  dtp1.DateTime := IncDay(DateOf(DM.tmp.fieldbyname('nowtime').AsDateTime),-7);
  dtp2.DateTime := DM.tmp.fieldbyname('nowtime').AsDateTime;
end;

end.
