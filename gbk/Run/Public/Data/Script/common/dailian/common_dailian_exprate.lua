--����֮����Ч��

--MisDescBegin
--�ű���
x800025_g_ScriptId = 800025
--MisDescEnd


function x800025_SubTrainExpRate( sceneId, level, attack, mode, constant )	--����������ִ�д˽ű�
	local mode = mode/10
	local Exp
	if level < 10 then
		Exp = ceil(level*attack*mode*2)
	else
		Exp = ceil(level*level*attack*mode/5)
	end
	
	if Exp > 0 then
		return Exp
	else
		return 0
	end
end





--**********************************
--������ں���
--**********************************
function x800025_OnDefaultEvent( sceneId, selfId, targetId )	

end

--**********************************
--�о��¼�
--**********************************
function x800025_OnEnumerate( sceneId, selfId, targetId )

end


--********************
--����������
--**********************************
function x800025_CheckAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800025_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800025_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x800025_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x800025_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x800025_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x800025_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x800025_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x800025_OnItemChanged( sceneId, selfId, itemdataId )
end
