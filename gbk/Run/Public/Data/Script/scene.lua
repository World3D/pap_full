--�����Ľű��ļ�



--�ű���

x888888_g_scriptId_scene = 888888



x888888_g_defaultRelive_SceneID_1=11;

x888888_g_defaultRelive_SceneID_2=11;



--MainHand=0,AssiHand=1,Head=2,Neck=3,Shoulder=4,Back=5,Wrist=6,Hand=7,Waist=8,Feet=9,Ring1=10,Ring2=11,Adorn1=12,Adorn2=13,Suit=14,Rider=15
x888888_g_Body_Equip_Index={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}

--0:ԭ�����𸴻�    1:ԭ�����𸴻�	2:���ж��㸴��
x888888_g_ReliveType ={OriginLosslessRelive=0,OriginDamageRelive=1, CityPosRelive=2}



function x888888_OnSceneInit( sceneId )

--�����ڳ�ʼ����ɺ����



end



function x888888_OnSceneTimer( sceneId, nowTime )

--������ʱ��

--sceneId��ʾ�����ţ�nowTime��ʾ��ǰʱ�䣨�����������ʱ�䣬��λ���룩



	local sceneType = LuaFnGetSceneType(sceneId) ;
    --PrintStr('sceneType ' .. tostring(sceneType));


	if sceneType == 1 then --���������Ǹ���

		local copyscenetype = LuaFnGetCopySceneData_Param(sceneId,0) ;--ȡ�ø�����

		local copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���

		if copyscenetype==FUBEN_EXAMPLE then --����

			--���Ӳ��ṩ��ʱʱ��

			print("����ʹ�����Ӹ������ͣ����Ӹ������Ͳ��ṩ��ʱ�¼�")

		elseif copyscenetype==FUBEN_EXAMPLE then --

			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;

		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7��ľ���︱��

			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;

		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9��ľ���︱��

			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;

		elseif copyscenetype==FUBEN_MURENXIANG then --��׼ľ���︱��

			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;

		elseif copyscenetype==FUBEN_SHUILAO then --ˮ�θ���

			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;

		elseif copyscenetype==FUBEN_ZHENGLONG then --������ָ���

			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
	
		elseif copyscenetype==FUBEN_MONSTERPARTY then --�����ܶ�Ա����
			
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
		elseif copyscenetype==FUBEN_HUOCAISHENDIAN then --�������
			
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;
			
		elseif copyscenetype==FUBEN_JUNYAOYAOKOU then --��ҤҤ�ڸ���
			
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;	
		elseif copyscenetype==FUBEN_GOULANQUTAI then --������̨����
			
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;	
		elseif copyscenetype==FUBEN_HUOCAISHENDIAN then --���������
			
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;	
		elseif copyscenetype==FUBEN_01 then --������
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;	
		elseif copyscenetype==FUBEN_02 then --������
			
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;	
		elseif copyscenetype==FUBEN_MANTUOSHANZHANG then --����ɽׯ
			CallScriptFunction( copyscenescript, "OnCopySceneTimer", sceneId, nowTime ) ;	
		end

	end

end



function x888888_OnSceneQuit( sceneId )

--�����ڹر�ǰ����



end


function x888888_OnScenePlayerFirstEnter( sceneId, playerId )

	--����ȱʡ����Ϣ

--	local wuqi={10031001} --,10021001,10031001,10041001,10051001,10061001,10011001,10011001,10011001,10011001,10011001,10011001,10131001,10011001,10011001,10011001}
--	local yifu = 10231001
--	local shoutao = 10251001
--	local xiezi = 10271001
--	local MenPai= GetMenPai( sceneId, playerId)
--	BeginAddItem(sceneId)
--		AddItem( sceneId,wuqi[MenPai+1],1)
--		AddItem( sceneId,yifu,1)
--		AddItem( sceneId,shoutao,1)
--		AddItem( sceneId,xiezi,1)
--	EndAddItem(sceneId,playerId)
--	AddItemListToHuman(sceneId,playerId)
--	UseItem(sceneId,playerId,wuqi[MenPai+1])
--	UseItem(sceneId,playerId,yifu)
--	UseItem(sceneId,playerId,shoutao)
--	UseItem(sceneId,playerId,xiezi)
	
end

function x888888_OnScenePlayerEnter( sceneId, playerId )

	--����ȱʡ�ĸ�����Ϣ
	
	local sceneType = LuaFnGetSceneType(sceneId) ;
	
	--[[
	if sceneType == 1 then --���������Ǹ���

		local copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���

		CallScriptFunction( copyscenescript, "OnPlayerEnter", sceneId, playerId ) ;

	else

		if	GetMenPai( sceneId, playerId)	~=9	then

			SetPlayerDefaultReliveInfo( sceneId, playerId, "%100", "-1", "0", x888888_g_defaultRelive_SceneID_1, 430, 428 );

		else

			SetPlayerDefaultReliveInfo( sceneId, playerId, "%100", "-1", "0", x888888_g_defaultRelive_SceneID_2, 430, 428 );

		end

	end
	--]]
	

end



--��Ҹ���Ľű��¼�
--ReliveType:���ʽ  	1.IB���������״̬��  2.��ȸ������״̬��  3.���ж��㸴��سǣ�����״̬��
function x888888_OnSceneHumanRelive( sceneId, selfId, ReliveType )

	--local money = 0
	--local level = GetLevel(sceneId, selfId)
	--if level > 0 and level <= 10 then
		--�۳�1����Ϸ��
	--	money = 1
	--elseif level > 10 and level <= 30 then
		--�۳�2����Ϸ��
	--	money = 2
	--elseif level > 30 and level <= 60 then	
		--�۳�3����Ϸ��	
	--	money = 3
	--elseif level > 60 and level <= 90 then	
		--�۳�4����Ϸ��	
	--	money = 4
	--elseif level > 90 and level <= 120 then	
		--�۳�5����Ϸ��	
	--	money = 5
	--elseif level > 120 and level <= 160 then	
		--�۳�6����Ϸ��	
	--	money = 6							
	--end
		
	if ReliveType == x888888_g_ReliveType.OriginLosslessRelive then
		--ib����	
		RestoreHp(sceneId, selfId,100)
		RestoreMp(sceneId, selfId,100)
		
		--������Ϸ��
		--CostMoney(sceneId, selfId,money)
				
		
	elseif ReliveType == x888888_g_ReliveType.OriginDamageRelive then
		--��ȸ���
		RestoreHp(sceneId, selfId,100)
		RestoreMp(sceneId, selfId,100)	
		
		--��������״̬
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 1000, 1000 * 60 *2);
		
		--������Ϸ��, ��ʱ��������Ϸ��
		--CostMoney(sceneId, selfId,money*2)	
				
	elseif ReliveType == x888888_g_ReliveType.CityPosRelive then
		--���ж��㸴��
		RestoreHp(sceneId, selfId,100)
		RestoreMp(sceneId, selfId,100)	
		
		--��������״̬
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 1000, 1000 * 60 *2);
		
		--newScendId����������ĳ���ID����߻�ָ��
		local newSceneId = -1
		local posX = -1
		local posZ = -1
		
		if sceneId == 11 then
			newSceneId = 11
			posX = 430
			posZ = 428
		elseif sceneId == 28 then
			newSceneId = 28
			posX = 32
			posZ = 99
		end
	
		if sceneId ~= newSceneId then
			if newSceneId == -1 then
				SetPos(sceneId,selfId,60,60)	
			else
				NewWorld(sceneId, selfId,newSceneId,posX,posZ)
			end
		else
			SetPos(sceneId,selfId,posX,posZ)	
		end
	end	
end


--���������ű��¼�
--1.������ҵȼ�����װ���;ö�
--2.�������PKֵ������δ����Ʒ
function x888888_OnSceneHumanDie( sceneId, selfId, killerId )

	local percent = 0
	
	local level = GetLevel(sceneId, selfId)
	if level > 0 and level <= 10 then
		--�;ý���1%~2%
		percent = random(2)
	elseif level > 10 and level <= 30 then
		--�;ý���2%-3%
		percent = random(2) + 1
	elseif level > 30 and level <= 60 then	
		--�;ý���3%-5%
		percent = random(3) + 2		
	elseif level > 60 and level <= 90 then	
		--�;ý���4%-8%
		percent = random(5) + 3			
	elseif level > 90 and level <= 120 then	
		--�;ý���7%-11%
		percent = random(5) + 6		
	elseif level > 120 and level <= 160 then	
		--�;ý���10%15%
		percent = random(6) + 9									
	end
	
	--�õ����װ����ǰ�;ö�
	local oldVal = LuaFnGetBodyItemDur(sceneId, selfId)
	local newVal = oldVal * ( (100 - percent) / 100 )
	
	local text = format("��ҵȼ� = %d,װ������%d/100,���;ö�%d��",level,percent,newVal )
	--PrintStr(text)
	
	for i=1,16 do 
		--�ı����װ���;ö�
		LuaFnSetBodyItemDur(sceneId, selfId,x888888_g_Body_Equip_Index[i],newVal)
	end
	

    local ObjType = LuaFnGetObjType(sceneId, killerId)
    
    if ObjType == 1 then -- OBJ_TYPE_HUMAN

    LuaFnAddEnemy(sceneId,selfId, killerId)
		--******************************************************************************
		--*PK�ͷ�                                                                      *
		--******************************************************************************
		local deltaLevel = abs(GetLevel(sceneId, selfId) - GetLevel(sceneId, killerId))
		local CountryIDSelf 	= GetCurCountry(sceneId, selfId)
		local CountryIDKiller	= GetCurCountry(sceneId, killerId)
		--ɱ������������һ�������ֵ��ͬʱ������Լ���PKֵ
		if CountryIDSelf == CountryIDKiller then
			local PKSelf = LuaFnGetPKValue(sceneId, selfId)
			local pkKiller = LuaFnGetPKValue(sceneId, killerId)
			if PKSelf > 10 then --���� ����������ߵȼ���-1��PKֵ��С�ڵ������ߵȼ���-2�㡣
			    if (GetLevel(sceneId, killerId) - GetLevel(sceneId, selfId)) > 0  then
			        pkKiller = pkKiller - 1
		            LuaFnSetPKValue(sceneId, killerId, pkKiller)
				elseif (GetLevel(sceneId, killerId) - GetLevel(sceneId, selfId)) < 0 then
			        pkKiller = pkKiller - 2
		            LuaFnSetPKValue(sceneId, killerId, pkKiller)
				end
			elseif PKSelf <= 10 then
			--������
			--ɱ��ͬ���Ǻ������
			--If 25 > |APlayerLevel-BplayerLevel| > 10 then
			--PK = |APlayerLevel-BplayerLevel|*2
			--Elseif |APlayerLevel-BplayerLevel|<=10 then
			--PK = |APlayerLevel-BplayerLevel|*1
			--Elseif |APlayerLevel-BplayerLevel| > = 25 then
			--PK = |APlayerLevel-BplayerLevel|*3
				local pkValue = LuaFnGetPKValue(sceneId, killerId)
				if deltaLevel > 10 and deltaLevel < 25 then
					pkValue  = pkValue + (deltaLevel * 2)
		            LuaFnSetPKValue(sceneId, killerId, pkValue)
				elseif deltaLevel <= 10 then
					pkValue  = pkValue + (deltaLevel * 1)
		            LuaFnSetPKValue(sceneId, killerId, pkValue)
				elseif deltaLevel >= 25 then
					pkValue  = pkValue + (deltaLevel * 3)
		            LuaFnSetPKValue(sceneId, killerId, pkValue)
				end
			end
			
			--a.��ҵȼ��ɱ�ֵȼ�-���ߵȼ������ձ��ȡ�÷�������n���ȼ�������
			--b.����PKֵ���ձ��ȡ�÷�������m��PKֵ������
			--c.�ͷ��㷨Ϊ(n/100+m/20)=z���ͷ�������
			--d.����z��ֵ���ձ�񣬻�þ������߳ͷ�����
 			--a
			local levelP 	= LuaFnGetPKLevel(sceneId, selfId, deltaLevel)
			--b
			local pkValue 	= LuaFnGetPKValue(sceneId, selfId)
			local PKP	 	= LuaFnGetPKPoint(sceneId, selfId, pkValue)
			--c
			local punishP	= levelP/100 + PKP/20
			local TotalValue= LuaFnGetPKPunish(sceneId, selfId, punishP)

			--d
			--��������TotalValue>100ʱ�����������ָ��������ָ�����ꡣ
			--��100>=TotalValue>70ʱ����ұ�ɱ����Ϊ����20%����60%
			--��70>=TotalValue>50ʱ����ұ�ɱ����Ϊ����150%����50%
			--��50>=TotalValue>20ʱ����ұ�ɱ����Ϊ����10%����30%

			--�õ���ұ���������δ����Ʒ��
			local ItemCntInBag = LuaFnGetNotBindItemCountInBag(sceneId, selfId)
			local ItemCntInBody = LuaFnGetNotBindItemCountInBody(sceneId, selfId)

			local DropCountInBag = 0

			local text = format("TotalValue = %d",TotalValue )
			--PrintStr(text)
				
			if TotalValue > 100 then
				--���͵�����   ToDo
			elseif TotalValue > 70 and TotalValue <= 100 then
				DropCountInBag 	= random (20 , 60) / 100 * ItemCntInBag
				DropCountInBody = random (20 , 60) / 100 * ItemCntInBody
			elseif TotalValue > 50 and TotalValue <= 70 then
				DropCountInBag = random (15 , 50) / 100 * ItemCntInBag
				DropCountInBody = random (15 , 50) / 100 * ItemCntInBody
			elseif TotalValue > 10 and TotalValue <= 50 then
				DropCountInBag = random (10 , 30) / 100 * ItemCntInBag
				DropCountInBody = random (10 , 30) / 100 * ItemCntInBody
			end

			local text = format("DropCountInBag = %d",DropCountInBag )
			--PrintStr(text)
				
			--���䱳��
			for i=1,DropCountInBag do
				local DropIndex = random(ItemCntInBag-i+1)
				LuaFnDropNotBindItemInBag(sceneId, selfId,DropIndex)
			end

			--��������װ��
			for i=1,DropCountInBody do
				local DropIndex = random(ItemCntInBody-i+1)
				local text = format("���� = %d",DropIndex )
				--PrintStr(text)
				LuaFnDropNotBindItemInBody(sceneId, selfId,DropIndex)
			end

			--AΪɱ�� BΪ����
			--APlayerLevel  -  BplayerLevel  >=  30  then  A����-5 B+3
			--30 > APlayerLevel  -  BplayerLevel  >=  0  then  A����-2 B+1
			--0 > APlayerLevel  -  BplayerLevel  >=  -30  then  A����+2 B-1
			---30 > APlayerLevel  -  BplayerLevel  then  A����+5 B-3
			local deltaLevel = GetLevel(sceneId, killerId) - GetLevel(sceneId, selfId)

			if deltaLevel >= 30 then
				LuaSubHonor(sceneId, killerId, 5)
				LuaAddHonor(sceneId, selfId, 3)
			elseif deltaLevel >= 0 and deltaLevel < 30 then
				LuaSubHonor(sceneId, killerId, 2)
				LuaAddHonor(sceneId, selfId, 1)
			elseif deltaLevel >= -30 and deltaLevel < 0 then
				LuaAddHonor(sceneId, killerId, 2)
				LuaSubHonor(sceneId, selfId, 1)
			elseif deltaLevel < -30 then
				LuaAddHonor(sceneId, killerId, 5)
				LuaSubHonor(sceneId, selfId, 3)
			end


		else			--��ͬ��
		
			--�õ����PKֵ
			local PKVal = LuaFnGetPKValue(sceneId, selfId)
			--�õ���ұ���������δ����Ʒ��
			local ItemCountInBag = LuaFnGetNotBindItemCountInBag(sceneId, selfId)
			local ItemCountInBody = LuaFnGetNotBindItemCountInBody(sceneId, selfId)

			local DropCountInBag = 0
			local DropCountInBody = 0

			if PKVal == 0 then
				--������δ�󶨵���Ʒ����10%��
				DropCountInBag = floor ( ItemCountInBag * 0.2  + 0.5 )
			elseif PKVal == 2 then
				--������δ�󶨵���Ʒ����15%
				DropCountInBag = floor ( ItemCountInBag * 0.15  + 0.5 )
			elseif PKVal == 3 then
				--������δ�󶨵���Ʒ����18%,����δ�󶨵���Ʒ����8%
				DropCountInBag = floor ( ItemCountInBag * 0.18  + 0.5 )
				DropCountInBody = floor ( ItemCountInBody * 0.08  + 0.5 )
			elseif PKVal == 4 then
				--������δ�󶨵���Ʒ����23%,����δ�󶨵���Ʒ����13%
				DropCountInBag = floor ( ItemCountInBag * 0.23  + 0.5 )
				DropCountInBody = floor ( ItemCountInBody * 0.13  + 0.5 )
			elseif PKVal == 5 then
				--������δ�󶨵���Ʒ����30%,����δ�󶨵���Ʒ����16%
				DropCountInBag = floor ( ItemCountInBag * 0.3  + 0.5 )
				DropCountInBody = floor ( ItemCountInBody * 0.16  + 0.5 )
			end

			text = format("���PKֵ = %d,��������%d��δ����Ʒ,����%d����",PKVal,ItemCountInBag,DropCountInBag )
			--PrintStr(text)

			--DropCountInBag = 1
			for i=1,DropCountInBag do
				local DropIndex = random(ItemCountInBag-i+1)
				LuaFnDropNotBindItemInBag(sceneId, selfId,DropIndex)
			end

			for i=1,DropCountInBody do
				local DropIndex = random(ItemCountInBody-i+1)
				LuaFnDropNotBindItemInBody(sceneId, selfId,DropIndex)
			end
		end

    
    elseif ObjType == 2 then -- OBJ_TYPE_MONSTER
        --�õ����PKֵ
		local PKVal = LuaFnGetPKValue(sceneId, selfId)
		--�õ���ұ���������δ����Ʒ��
		local ItemCountInBag = LuaFnGetNotBindItemCountInBag(sceneId, selfId)
		local ItemCountInBody = LuaFnGetNotBindItemCountInBody(sceneId, selfId)

		local DropCountInBag = 0
		local DropCountInBody = 0

		if PKVal == 0 then
			--������δ�󶨵���Ʒ����10%��
			DropCountInBag = floor ( ItemCountInBag * 0.2  + 0.5 )
		elseif PKVal == 2 then
			--������δ�󶨵���Ʒ����15%
			DropCountInBag = floor ( ItemCountInBag * 0.15  + 0.5 )
		elseif PKVal == 3 then
			--������δ�󶨵���Ʒ����18%,����δ�󶨵���Ʒ����8%
			DropCountInBag = floor ( ItemCountInBag * 0.18  + 0.5 )
			DropCountInBody = floor ( ItemCountInBody * 0.08  + 0.5 )
		elseif PKVal == 4 then
			--������δ�󶨵���Ʒ����23%,����δ�󶨵���Ʒ����13%
			DropCountInBag = floor ( ItemCountInBag * 0.23  + 0.5 )
			DropCountInBody = floor ( ItemCountInBody * 0.13  + 0.5 )
		elseif PKVal == 5 then
			--������δ�󶨵���Ʒ����30%,����δ�󶨵���Ʒ����16%
			DropCountInBag = floor ( ItemCountInBag * 0.3  + 0.5 )
			DropCountInBody = floor ( ItemCountInBody * 0.16  + 0.5 )
		end

		text = format("���PKֵ = %d,��������%d��δ����Ʒ,����%d����",PKVal,ItemCountInBag,DropCountInBag )
		--PrintStr(text)

		--DropCountInBag = 1
		for i=1,DropCountInBag do
			local DropIndex = random(ItemCountInBag-i+1)
			LuaFnDropNotBindItemInBag(sceneId, selfId,DropIndex)
		end

		for i=1,DropCountInBody do
			local DropIndex = random(ItemCountInBody-i+1)
			LuaFnDropNotBindItemInBody(sceneId, selfId,DropIndex)
		end

    end


	local sceneType = LuaFnGetSceneType(sceneId) 
	if sceneType == 1 then --���������Ǹ���

		local copyscenescript = LuaFnGetCopySceneData_Param(sceneId,1) ; --ȡ�ýű���

		CallScriptFunction( copyscenescript, "OnHumanDie", sceneId, selfId, killerId )

	end

end




function x888888_OnSceneHumanLevelUp( sceneId, objId, level )

end



function x888888_OnSceneNotify( sceneId, destsceneId )

--sceneId Ϊ����������ڳ���ID, destsceneIdΪ��������ID

--�˺�����Ӧ���ñ�ʾ���������Ѿ���ʼ����ɣ����Դ��������



	local destsceneType = LuaFnGetSceneType(destsceneId) ;



	if destsceneType == 1 then --���������Ǹ���



		copyscenetype = LuaFnGetCopySceneData_Param(destsceneId,0) ;--ȡ�ø�����

		copyscenescript = LuaFnGetCopySceneData_Param(destsceneId,1) ; --ȡ�ýű���



		if copyscenetype==FUBEN_EXAMPLE then --����

			--���Ӳ��ṩ���������¼�

			print("����ʹ�����Ӹ������ͣ����Ӹ������Ͳ��ṩ���������¼�")

		elseif copyscenetype==FUBEN_EXAMPLE then --

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;

		elseif copyscenetype==FUBEN_MURENXIANG_7 then --7��ľ���︱��

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;

		elseif copyscenetype==FUBEN_MURENXIANG_9 then --9��ľ���︱��

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;

		elseif copyscenetype==FUBEN_MURENXIANG then --��׼ľ���︱��

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;

		elseif copyscenetype==FUBEN_SHUILAO then --ˮ�θ���

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;

		elseif copyscenetype==FUBEN_ZHENGLONG then --������ָ���

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;

		elseif copyscenetype==FUBEN_MONSTERPARTY then --�����ܶ�Ա����

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
		elseif copyscenetype==FUBEN_HUOCAISHENDIAN then --�������

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;
			
		elseif copyscenetype==FUBEN_JUNYAOYAOKOU then --��ҤҤ�ڸ���

			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;	
		elseif copyscenetype==FUBEN_GOULANQUTAI then --������̨����
			
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;	
		elseif copyscenetype==FUBEN_HUOCAISHENDIAN then --���������
			
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;	
		elseif copyscenetype==FUBEN_01 then --������
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;	
		elseif copyscenetype==FUBEN_02 then --������
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;	
		elseif copyscenetype==FUBEN_MANTUOSHANZHANG then --����ɽׯ
			CallScriptFunction( copyscenescript, "OnCopySceneReady", sceneId, destsceneId ) ;	
		end

	end

end



-- ��·

function x888888_AskTheWay( sceneId, selfId, sceneNum, x, y, tip )

	Msg2Player( sceneId, selfId, "@*;flagNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )

	Msg2Player( sceneId, selfId, "@*;flashNPC;" .. sceneNum .. ";" .. x .. ";" .. y .. ";" .. tip, MSG2PLAYER_PARA )

end



-- ������Ч��UICommandID = 123

function x888888_PlaySoundEffect( sceneId, selfId, soundId )

	BeginUICommand(sceneId)

		UICommand_AddInt(sceneId, soundId)

	EndUICommand(sceneId)

	DispatchUICommand(sceneId,selfId, 123)

end



--������ܼ��

function x888888_OnAcceptMissionCheck( sceneId, selfId, missionScript )

	if GetMissionCount(sceneId, selfId)>=20 then

		BeginEvent(sceneId)

		local	strText = "����������"

			AddText(sceneId,strText);

		EndEvent(sceneId)

		DispatchMissionTips(sceneId,selfId)

		return 0

	end

	

	return 1

end

--����NpcĬ�϶Ի���

function x888888_OnNpcDefaultDialog( sceneId, selfId, targetId)
	
	local npcType = GetMonsterDataID(sceneId,targetId)
	BeginEvent(sceneId)

		local strText = "&&"..npcType.."&&"

		AddText(sceneId,strText);

	EndEvent(sceneId)	
	DispatchEventList(sceneId,selfId,targetId)

	return 1

end


function x888888_OnNpcDefaultEventList( sceneId, selfId, targetId)
	BeginEvent(sceneId)
	local npcType = GetMonsterDataID(sceneId,targetId)


		local strText = "&&"..npcType.."&&"

		AddText(sceneId,strText);
		ShowNpcEventList(sceneId,selfId,targetId)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	return 1

end




--************************
--
--ģ�庯��
--
--************************

--****��ӡ˵��*********

--����˵����
--	sceneId:							
--	MissionName:					������
--	Info:									Ҫ��ʾ������˵�����߼���˵��
--	MissionTarget:				����Ŀ��
--	DemandItems:					����Ҫ����Ʒ
--	MoneyBonus:						��������Ǯ
--	ItemBonus:						����������
--	RandItemBonus:				�������������
--	RadioItemBonus:				��������ѡ����
--����˵����
--	�������ı�������ʾ����Ҫ��ʾ����Ϣ
--�÷�˵����
--	��Ҫ�����Event���ڣ���ҪDispatchʵ�֣����Բ�����дnil��������

function x888888_PrintInfo(sceneId, MissionName, Info, MissionTarget, DemandItems, MoneyBonus, ItemBonus, RandItemBonus, RadioItemBonus)

	AddText(sceneId, MissionName)
	AddText(sceneId, Info)
	AddText(sceneId, "#Y����Ŀ��")
	AddText(sceneId, MissionTarget)
	
	if DemandItems ~= nil then
		for i, item in DemandItems do
			AddItemDemand(sceneId, item.id, item.num)
		end
	end
	
	if MoneyBonus ~= nil then
		AddMoneyBonus(sceneId, MoneyBonus)
	end
	if ItemBonus ~= nil then
		for i, item in ItemBonus do
			AddItemBonus(sceneId, item.id, item.num)
		end
	end
	if RandItemBonus ~= nil then
		for i, item in RandItemBonus do
			AddRandItemBonus(sceneId, item.id, item.num)
		end
	end
	if RadioItemBonus ~= nil then
		for i, item in RadioItemBonus do
			AddRadioItemBonus(sceneId, item.id, item.num)
		end
	end
		
end

--*******�鿴�Ƿ�����Ʒ**********

--����˵����
--	sceneId:							
--	selfId:
--	Items:				������ĵ���
--����˵����
--	������������Ƿ��и���Ʒ
--�÷�˵����
--	��������ṹ��
--		id�����߱��
--		num�����߸���
function x888888_CheckHaveItems(sceneId, selfId, Items)

	if Items ~= nil then
		for i, item in Items do
			return HaveItem(sceneId, selfId, item.id)
		end
	end
	
	return 0

end

--******ɾ����������Ʒ*********

--����˵����
--	sceneId:							
--	selfId:			
--	ItemToDelete:				��Ҫɾ���ĵ���
--	ItemToAdd:					��Ҫ��ӵĵ���
--	NormalMessage:			�����������ʾ����Ϣ
--	ErrorMessage:				��������ʱ����ʾ����Ϣ
--����˵����
--	�������ı�������ʾ����Ҫ��ʾ����Ϣ
--�÷�˵����
--	��Ҫ�����Event���ڣ���ҪDispatchʵ�֣����Բ�����дnil��������
--	����������ɾ��֮ǰӦ�ж��Ƿ��иõ���
--	��������ṹ��
--		id�����߱��
--		num�����߸���
function x888888_DeleteAndAddItem(sceneId, selfId, ItemToDelete, ItemToAdd, NormalMessage, ErrorMessage)

	local ret = 1
	local message = nil
	
	if ItemToAdd ~= nil then
		BeginAddItem(sceneId)
		--����������б�
		for i, item in ItemToAdd do
			AddItem(sceneId,item.id, item.num)
		end
	
		ret = EndAddItem(sceneId, selfId)
	
		if ret > 0 then
		
			AddItemListToHuman(sceneId, selfId)
			message = NormalMessage
		
		else
		
			message = ErrorMessage
			
		end
		
	end
	
	if ItemToDelete ~= nil then
	
		--����������ɾ����֮ǰӦ�ж��Ƿ��е��ߣ�
		for i, item in ItemToDelete do
			DelItem(sceneId, selfId, item.id, item.num)
		end
		
	end
	
	BeginEvent(sceneId)

	if message ~= nil then
		AddText(sceneId, message)
	end

	EndEvent(sceneId)

	DispatchMissionTips(sceneId, selfId)
	
	return ret

end
