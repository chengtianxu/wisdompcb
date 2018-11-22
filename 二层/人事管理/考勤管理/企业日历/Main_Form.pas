unit Main_Form;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DateUtils, Menus, ComCtrls;
type
  TFRM_Date = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Image1: TImage;
    Label20: TLabel;
    Label16: TLabel;
    Bevel2: TBevel;
    Shape2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    day1: TLabel;
    Cnday: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    MenuMonth: TPopupMenu;
    MenuMonth_1: TMenuItem;
    MenuMonth_2: TMenuItem;
    MenuMonth_3: TMenuItem;
    MenuMonth_4: TMenuItem;
    MenuMonth_5: TMenuItem;
    MenuMonth_6: TMenuItem;
    MenuMonth_7: TMenuItem;
    MenuMonth_8: TMenuItem;
    MenuMonth_9: TMenuItem;
    MenuMonth_10: TMenuItem;
    MenuMonth_11: TMenuItem;
    MenuMonth_12: TMenuItem;
    MenuYear: TPopupMenu;
    image_month: TImage;
    image_year: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    image_today: TImage;
    shp1: TShape;
    Image2: TImage;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    procedure CnDayClick(Sender: TObject);
    procedure CHnDayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure CnDayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ChnDateMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
//    procedure StaticText1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuMonth_1Click(Sender: TObject);
    procedure lbl4Click(Sender: TObject);
    procedure image_todayClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadLAB;
    procedure DateChange(MyTime: TDateTime);
//    procedure OK;
    procedure YearClick(Sender: TObject);
  public
    { Public declarations }
    FPicture_AlphaBlend: Byte;
    FPicture: TbitMap;
    NDate: Tdate;
    YearEdit, MonthEdit, DayEdit: TEdit;
    ChDateLabel: TLabel;
    procedure ShowDateWin(YearEdit1, MonthEdit1, DayEdit1: TEdit; {ChDateLabel1: TLabel;} HostControl: TControl; Bmp: TBitMap = nil; iAlphaBlend: Byte = 150);
  end;
var
  FRM_Date: TFRM_Date;
  CnDate: array[1..37] of TLabel;
  ChnDate: array[1..37] of TLabel;
  imagetmp : array[1..37] of TImage;

  NYear, NMonth, NDay: Word;
  MHostControl: TControl;
implementation
uses DateCn;
{$R *.DFM}
function FormExists(FORM_NAME: string): BOOLEAN;
begin
  if Application.FindComponent(FORM_NAME) = nil then
    RESULT := FALSE
  else
    RESULT := TRUE;
end;
function DayOfMonth(Year, Month: Integer): integer; overload;
begin
  try
    Result := MonthDays[IsLeapYear(Year), Month];
  except
    Result := 0;
  end;
end;
function DayOfMonth(Dates: TDateTime): integer; overload;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Dates, Year, Month, day);
  Result := MonthDays[IsLeapYear(Year), Month];
end;
function DaysOfMonth(Dates: TDateTime): Integer;
begin
  Result := DayOfMonth(YearOf(Dates), MonthOf(Dates));
end;
function SetDateTime(NYear, NMonth, NDay: Word): TDate;
var
  MyDay: Word;
begin
  MyDay := DayOfMonth(NYear, NMonth);
  if MyDay < NDay then
    NDay := MyDay;
  Result := EncodeDate(NYear, NMonth, NDay);
end;

procedure TFRM_Date.LoadLAB;
var
  i: integer;
begin
  for i := 1 to 37 do
  begin
    CnDate[i] := TLabel.Create(self);
    CnDate[i].parent := Panel1;
    ChnDate[i] := TLabel.Create(self);
    ChnDate[i].parent := Panel1;
    {imagetmp[i] := TImage.Create(self);
    imagetmp[i].parent := Panel1;
    imagetmp[i].PopupMenu := PopupMenu1;}
    CnDate[i].OnClick := CnDayClick;
    CnDate[i].OnMouseDown := CnDayMouseDown;
    //ChnDate[i].OnClick := ChnDayClick;
    //ChnDate[i].OnMouseDown := ChnDateMouseDown;
    CnDate[i].AutoSize := false;
    ChnDate[i].AutoSize := false;
    CnDate[i].Width := day1.Width;
    ChnDate[i].Width := Cnday.Width;
    CnDate[i].Height := day1.Height;
    ChnDate[i].Height := Cnday.Height;
    CnDate[i].Alignment := day1.Alignment;
    ChnDate[i].Alignment := Cnday.Alignment;
    CnDate[i].Layout := day1.Layout;
    ChnDate[i].Layout := Cnday.Layout;
    ChnDate[i].PopupMenu := PopupMenu1;
    CnDate[i].PopupMenu := PopupMenu1;
    if i = 1 then
    begin
      CnDate[i].Left := day1.Left;
      CnDate[i].Top := day1.Top;
      ChnDate[i].Left := Cnday.Left;
      ChnDate[i].Top := Cnday.Top;
    end
    else
    begin
      if ((i - 1) mod 7) = 0 then
      begin
        CnDate[i].Top := CnDate[i - 1].Top + 70;
        CnDate[i].Left := day1.Left;
        ChnDate[i].Top := ChnDate[i - 1].Top + 70;
        ChnDate[i].Left := Cnday.Left;
      end
      else
      begin
        CnDate[i].Top := CnDate[i - 1].Top;
        CnDate[i].Left := CnDate[i - 1].Left + 100;
        ChnDate[i].Top := ChnDate[i - 1].Top;
        ChnDate[i].Left := ChnDate[i - 1].Left + 100;
      end;
    end;
    CnDate[i].Font := day1.Font;
    ChnDate[i].Font := Cnday.Font;
    CnDate[i].Font.Color := clBlack;
    CnDate[i].AutoSize := false;
    ChnDate[i].AutoSize := false;
    CnDate[i].Transparent := true;
    ChnDate[i].Transparent := true;
  end;
end;
procedure TFRM_Date.DateChange(MyTime: TDateTime);
var
  i, S: integer;
  StarNo: integer;
  Present: TDateTime;
  Year, Month, Day: Word;
begin
  Label20.Caption := IntToStr(DateUtils.YearOf(Mytime));
  Label17.Caption := IntToStr(DateUtils.MonthOf(Mytime));
  Label16.Caption := Label17.Caption;
  Label1.Caption := IntToStr(DateUtils.YearOf(Mytime));
  Label21.Caption := Copy(CnSkyStemOfYear(Mytime), 1, 2) + CnanimalOfYear(Mytime);
  lbl1.Caption := '选定日期为：'+DateToStr(Mytime);
  lbl2.Caption := Copy(CnSkyStemOfYear(Mytime), 1, 2) + Copy(CnanimalOfYear(Mytime),1,2)+'年'+CnMonthOfDate(Mytime)+CnDayOfDate(Mytime);
  lbl3.Caption := GetLunarHolDay(Mytime)+CnDayOfDateJr(Mytime)+Holiday(Mytime,DayOf(Mytime));
  for i := 1 to 37 do
  begin
    CnDate[i].Visible := false;
    ChnDate[i].Visible := false;
    //CnDate[i].Font.Size := 11;
    //CnDate[i].Color := self.Color;
    //ChnDate[i].Color := self.Color;
    if (((i) mod 7) = 0) or (((i) mod 7) = 1) then
    begin
      CnDate[i].Font.Color := clRed;
      ChnDate[i].Font.Color := clRed;
    end
    else
    begin
      CnDate[i].Font.Color := clBlack;
      ChnDate[i].Font.Color := Cnday.Font.Color;
    end;
  end;
  DecodeDate(MyTime, Year, Month, Day);
  Present := EncodeDate(Year, Month, 1);
  StarNo := dayofweek(Present);
  s := starno + DayOfMonth(Present) - 1;
  try
    for i := StarNo to s do
    begin
      Present := EncodeDate(Year, Month, i - StarNo + 1);
      CnDate[i].Caption := IntToStr(i - StarNo + 1);
      CnDate[i].Tag := i - StarNo + 1;
      ChnDate[i].Tag := CnDate[i].Tag;
      ChnDate[i].Caption := CnDayOfDate(Present);
      if ChnDate[i].Caption = '初一' then
      begin
        ChnDate[i].Caption := CnMonthOfDate(Present);
        ChnDate[i].Font.Color := clRed;
      end ;
      if length(Holiday(MyTime, i - StarNo + 1)) > 3 then
      begin
        ChnDate[i].Caption := Holiday(MyTime, i - StarNo + 1);
        ChnDate[i].Font.Color := $000080FF;
      end;
      if DateCn.GetLunarHolDay(Present) <> '' then
      begin
        ChnDate[i].Caption := GetLunarHolDay(Present);
        ChnDate[i].Font.Color := $00FF5353;
      end;
      if DateCn.CnDayOfDateJr(Present) <> '' then
      begin
        ChnDate[i].Caption := CnDayOfDateJr(Present);
        ChnDate[i].Font.Color := $000080FF;
      end;
      if i - StarNo + 1 = day then
      begin
        Shape2.Left := CnDate[i].left - 1;
        Shape2.Top := CnDate[i].top + 1;
        Label22.Caption := Constellation(Present, day);
      end;
      CnDate[i].Visible := true;
      ChnDate[i].Visible := true;
    end;
  except
    on EConvertError do
    begin
      exit;
    end
  else
    exit;
  end;
end;

procedure TFRM_Date.FormCreate(Sender: TObject);
var
  i, x, y: Integer;
  d: TDate;
  MenuItem, ChildMenuItem: TMenuItem;
begin
  d := StrToDate('2004-1-1');
  for i := 1 to 12 do
  begin
    TMenuItem(FindComponent('MenuMonth_' + IntToStr(i))).Caption := FormatDateTime('mmmm', d);
    d := IncMonth(d);
  end;
  x := 1901;
  i := 0;
  while x <= 2050 do
  begin
    MenuItem :=NewItem(IntToStr(x - 1),0, False, True, nil, 0, 'MenuYear_' + IntToStr(x - 1));
    MenuYear.Items.Add(MenuItem);
    y := x;
    while y < x + 10 do
    begin
      ChildMenuItem := NewItem(IntToStr(y),
        0, False, True, YearClick, 0, 'MenuYear_' + IntToStr(y));
      ChildMenuItem.Tag := y;
      MenuYear.Items[i].Add(ChildMenuItem);
      Inc(y);
    end;
    x := x + 10;
    Inc(i);
  end;
  LoadLAB;
  NDate := Date;
end;

procedure TFRM_Date.FormShow(Sender: TObject);
begin
  DecodeDate(NDate, NYear, NMonth, NDay);
  DateChange(NDate);
end;
procedure TFRM_Date.image_todayClick(Sender: TObject);
begin
  DateChange(today);
end;

procedure TFRM_Date.lbl4Click(Sender: TObject);
begin
  DateChange(today);
end;

procedure TFRM_Date.CHnDayClick(Sender: TObject);
begin
  Nday := (sender as TLabel).Tag;
end;
procedure TFRM_Date.CnDayClick(Sender: TObject);
begin
  Nday := (sender as TLabel).Tag;
end;
procedure TFRM_Date.FormDeactivate(Sender: TObject);
begin
  Self.Close;
end;

procedure TFRM_Date.ChnDateMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Present: TDate;
begin
  Shape2.Left := (sender as TLabel).left;
  Shape2.Top := (sender as TLabel).top - 19;
  Nday := (sender as TLabel).Tag;
  ShowMessage(IntToStr((sender as TLabel).tag));
  Present := SetDateTime(NYear, NMonth, NDay);
  Label22.Caption := Constellation(Present, NDay);
  lbl1.Caption := '选定日期为：'+DateToStr(Present);
  lbl2.Caption := Copy(CnSkyStemOfYear(Present), 1, 2) + Copy(CnanimalOfYear(Present),1,2)+'年'+CnMonthOfDate(Present)+CnDayOfDate(Present);
  lbl3.Caption := GetLunarHolDay(Present)+CnDayOfDateJr(Present)+Holiday(Present,DayOf(Present));
end;

procedure TFRM_Date.CnDayMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Present: TDate;
  shapetemp : TShape;
begin
  Shape2.Left := (sender as TLabel).left - 1;
  Shape2.Top := (sender as TLabel).top + 1;
  Nday := (sender as TLabel).Tag;
  Present := SetDateTime(NYear, NMonth, NDay);
  Label22.Caption := Constellation(Present, NDay);
  lbl1.Caption := '选定日期为：'+DateToStr(Present);
  lbl2.Caption := Copy(CnSkyStemOfYear(Present), 1, 2) + Copy(CnanimalOfYear(Present),1,2)+'年'+CnMonthOfDate(Present)+CnDayOfDate(Present);
  lbl3.Caption := GetLunarHolDay(Present)+CnDayOfDateJr(Present)+Holiday(Present,DayOf(Present));
end;

procedure TFRM_Date.ShowDateWin(YearEdit1, MonthEdit1, DayEdit1: TEdit;
  HostControl: TControl; Bmp: TBitMap = nil; iAlphaBlend: Byte = 150);
begin
end;
procedure TFRM_Date.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.RemoveComponent(Self);
  Self := nil;
  Self.Free;
end;
procedure TFRM_Date.MenuMonth_1Click(Sender: TObject);
var
  Present: TDate;
begin
  NMonth := TMenuItem(Sender).Tag;
  Present := SetDateTime(NYear, NMonth, NDay);
  DateChange(Present);
end;
procedure TFRM_Date.YearClick(Sender: TObject);
var
  Present: TDate;
begin
  NYear := TMenuItem(Sender).Tag;
  Present := SetDateTime(NYear, NMonth, NDay);
  DateChange(Present);
end;
procedure TFRM_Date.N11Click(Sender: TObject);
begin
   CnDate[NDay+6].Transparent :=False;
   CnDate[NDay+6].Color := clBlue;
   ChnDate[NDay+6].Transparent :=False;
   ChnDate[NDay+6].Color := clBlue;
 //      CnDate[NDay+6].Transparent := true;
 //   ChnDate[NDay+6].Transparent := true;
end;

procedure TFRM_Date.N21Click(Sender: TObject);
begin
   CnDate[NDay+6].Transparent :=False;
   CnDate[NDay+6].Color := clRed;
   ChnDate[NDay+6].Transparent :=False;
   ChnDate[NDay+6].Color := clRed;
end;

procedure TFRM_Date.Button1Click(Sender: TObject);
var
    i: Integer;
begin
     for i := 0 to 37 do
     begin
          if CnDate[i].Color = clBlue then
          ShowMessage(CnDate[i].Caption);
     end;
end;

end.

