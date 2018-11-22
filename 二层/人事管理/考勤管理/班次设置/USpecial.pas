unit USpecial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TSpecial_Form = class(TForm)
    grb_other: TGroupBox;
    lb_1: TLabel;
    lb_2: TLabel;
    lb_3: TLabel;
    lb_4: TLabel;
    lb_5: TLabel;
    lb_6: TLabel;
    lb_7: TLabel;
    lb_8: TLabel;
    lb_9: TLabel;
    lb_10: TLabel;
    lb_11: TLabel;
    lb_13: TLabel;
    lb_14: TLabel;
    lb_15: TLabel;
    lb_16: TLabel;
    lb_17: TLabel;
    lb_18: TLabel;
    lb_19: TLabel;
    lb_20: TLabel;
    lb_110: TLabel;
    lb_111: TLabel;
    lb_112: TLabel;
    lb_113: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    CheckBox18: TCheckBox;
    Edit16: TEdit;
    Edit15: TEdit;
    Edit14: TEdit;
    Edit13: TEdit;
    Edit12: TEdit;
    Edit11: TEdit;
    grb_segment: TGroupBox;
    lb_12: TLabel;
    lb_21: TLabel;
    lb_22: TLabel;
    lb_23: TLabel;
    lb_24: TLabel;
    lb_25: TLabel;
    lb_26: TLabel;
    lb_114: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    bbt_ok: TBitBtn;
    bbt_cancel: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure bbt_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    SubFtag : Integer;
    procedure initd;
    { Public declarations }
  end;

var
  Special_Form: TSpecial_Form;

implementation
uses
  UMain, UDM;


{$R *.dfm}

procedure TSpecial_Form.initd;
var
  i : Integer;
begin
    if SubFtag = 1 then
    begin
              try
                   for i := 1 to 16 do
                   begin
                        if Main_Form.Specialreal[i] <> 0.00 then
                        begin
                             (Self.FindComponent('Edit'+IntToStr(i)) As TEdit).Text := FloatToStr(Main_Form.Specialreal[i]);
                        end
                      else
                        begin
                              Main_Form.Specialreal[i]:= 0.00;
                        end;
                   end;
                   for i := 1 to 18 do
                    begin
                      (Self.FindComponent('CheckBox'+IntToStr(i)) As TCheckBox).Checked := Main_Form.Specialbit[i];
                    end ;
              except
                showmessage('数据出错,请与管理员联系');
              end;
    end;
end;

procedure TSpecial_Form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.',#8]) then //只能输入数字及小数点，还想控制只让输入什么，自己在[]中自己填加
    key:=#0;
   if (key='.') and (Pos('.',(Sender as TEdit).Text)>0) then //如果输入的是小数点，并且前面已有小数点就不让输入了
    key:=#0;
end;

procedure TSpecial_Form.bbt_okClick(Sender: TObject);
var
  i : Integer;
  ETime1, ETime2, ETime3, ZLtime : Double;
begin
              try
                   for i := 1 to 16 do
                   begin
                        if (Self.FindComponent('Edit'+IntToStr(i)) As TEdit).Text <> '' then
                        begin
                              Main_Form.Specialreal[i] :=  strtofloat((Self.FindComponent('Edit'+IntToStr(i)) As TEdit).Text);
                        end else begin
                              Main_Form.Specialreal[i] := 0.00;
                        end;
                   end;
                   for i := 1 to 18 do
                    begin
                    if (Self.FindComponent('CheckBox'+IntToStr(i)) As TCheckBox).Checked then
                               Main_Form.Specialbit[i] := True
                        else
                               Main_Form.Specialbit[i] := False;
                    end; 
              except
                              showmessage('保存数据失败,请与管理员联系');
              end;
              Main_Form.CheckBox6Click(CheckBox6);
              { ETime1 := 0.00;
              ETime2 := 0.00;
              ETime3 := 0.00;
              if  (Edit15.Text <> '') then
              DM.time1 := StrToFloat(Edit15.Text);
              if  (Edit16.Text <> '') then
              DM.time2 := StrToFloat(Edit16.Text);
              if  (Edit15.Text <> '') and (Main_Form.chk_1.Checked) then ETime1 := StrToFloat(Edit15.Text); //时段1-2直落补勤
              if  (Edit16.Text <> '') and (Main_Form.chk_2.Checked) then ETime2 := StrToFloat(Edit16.Text); //时段2-3直落补勤
              ETime3 := (ETime1 + ETime2) / 60;
              Main_Form.Edit4.Text := FloatToStr(strtofloat(Main_Form.Edit4.Text) +  ETime3);
              }
              Self.ModalResult := mrOk;
              showmessage('异常规则已设置,请在基本规则中保存！');
end;



end.
