

--ɱ������
--���ʿ��
--MisDescBegin
--�ű���
x910014_g_ScriptId = 910014

--�����Ƕ�̬**************************************************************

--�����ı�����
x910014_g_MissionName="60������װ"


x910014_g_ZhiYeItemBonus1={{id=10014001,num=1},{id=10074001,num=1},{id=10204001,num=1},{id=10214001,num=1},{id=10224001,num=1},{id=10234001,num=1}}
x910014_g_ZhiYeItemBonus2={{id=10244001,num=1},{id=10254001,num=1},{id=10264001,num=1},{id=10274001,num=1},{id=10284001,num=1},{id=10294001,num=1}}

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x910014_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	BeginEvent(sceneId)
			local zhiye = LuaFnGetMenPai(sceneId, selfId)
			
			--LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
			local ret
			BeginAddItem(sceneId)
				for i, item in pairs(x910014_g_ZhiYeItemBonus1) do
					if i < 3 then
						AddItem( sceneId,item.id+10000*zhiye+1, item.num )
					else
						AddItem( sceneId,item.id+10*zhiye+1, item.num )
					end
				end			
			ret = EndAddItem(sceneId,selfId)
			if ret > 0 then
				AddItemListToHuman(sceneId,selfId)
				BeginAddItem(sceneId)
					for i, item in pairs(x910014_g_ZhiYeItemBonus2) do
						AddItem( sceneId,item.id+10*zhiye+1, item.num )
					end
				ret = EndAddItem(sceneId,selfId)
				--���ְҵ��Ʒ
				if ret > 0 then
					AddItemListToHuman(sceneId,selfId)
					BeginEvent(sceneId)
						strText = "������һ��60������װ"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
					AddText(sceneId,"����60������װ�����պ��ˣ�")
				else
				--ְҵ��Ʒû�мӳɹ�
					BeginEvent(sceneId)
						strText = "�����ռ䲻�㣬�޷����ȫ����Ʒ��"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					AddText(sceneId,"����һ����60������װ��")
				end	
			else
				BeginEvent(sceneId)
					strText = "�����ռ䲻�㣬�޷������Ʒ��"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				AddText(sceneId,"�������±�������������ȡ��װ�ɣ�")
			end							
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�о��¼�
--**********************************
function x910014_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId,x910014_g_ScriptId,x910014_g_MissionName);
end



--**********************************
--����
--**********************************
function x910014_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x910014_OnAbandon( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x910014_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x910014_CheckSubmit( sceneId, selfId )

end

--**********************************
--�ύ
--**********************************
function x910014_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x910014_OnKillObject( sceneId, selfId, objdataId )

end

--**********************************
--���������¼�
--**********************************
function x910014_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x910014_OnItemChanged( sceneId, selfId, itemdataId )
end
