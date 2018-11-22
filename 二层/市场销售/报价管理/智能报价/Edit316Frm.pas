unit Edit316Frm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmEdit316 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb1: TComboBox;
    mmoCalcStr: TMemo;
    btn1: TButton;
    btn2: TButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FTag: Integer;//0 新增 1编辑
    FEditrkey:Integer;
  end;

implementation

uses
  Pick_Item_Single, ConstVar, damo;

{$R *.dfm}

procedure TfrmEdit316.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmEdit316.btn1Click(Sender: TObject);
var
  LSql: string;
begin
  case FTag of
    0:
    begin
      LSql := 'select 1 from data0316 where spec_key = ' + IntToStr(cbb1.ItemIndex);
      dm.SqlOpen(LSql);
      if not dm.qrytmp.IsEmpty then
      begin
        ShowMessage('基价类型重复');
        Exit;
      end;
            
      LSql := 'select * from data0316 where rkey = -1';
      dm.SqlOpen(LSql);
      dm.qrytmp.Append;
      dm.qrytmp.FieldByName('Spec_key').AsInteger := cbb1.ItemIndex;
      dm.qrytmp.fieldbyname('valuestr').AsString := mmoCalcStr.Text;
      dm.qrytmp.Post;

      ModalResult := mrOk;
    end;
    1:
    begin
      LSql := ' select * from data0316 where rkey = ' + IntToStr(FEditrkey);
      dm.SqlOpen(LSql);
      dm.qrytmp.Edit;
      dm.qrytmp.FieldByName('valuestr').AsString := mmoCalcStr.Text;
      dm.qrytmp.Post;

      ModalResult := mrOk;
    end;
  end;


end;

end.
