unit DatePick;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls;

type
  TfrmDatePick = class(TForm)
    MonthCalendar1: TMonthCalendar;
    Panel1: TPanel;
    btnSelect: TButton;
    btnCancel: TButton;
    procedure MonthCalendar1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitForm(inDate:TDatetime);
    function GetDate:TDatetime;
  end;

var
  frmDatePick: TfrmDatePick;

implementation

{$R *.dfm}

function TfrmDatePick.GetDate: TDatetime;
begin
  result := MonthCalendar1.Date;
end;

procedure TfrmDatePick.InitForm(inDate: TDatetime);
begin
  MonthCalendar1.Date := inDate;
end;

procedure TfrmDatePick.MonthCalendar1DblClick(Sender: TObject);
begin
  ModalResult := mrok;
end;

end.
